import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/customSearch.dart';
import 'package:evolvify/features/search/presentation/views/widgets/search_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController searchController = TextEditingController();

  List<String> searchHistoy = [];
  @override
  void initState() {
    super.initState();
    loadSearchHistory();
  }

  void loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      searchHistoy = prefs.getStringList('search_history') ?? [];
    });
  }

  void saveSearch(String keyWord) async {
    final prefs = await SharedPreferences.getInstance();
    searchHistoy = prefs.getStringList('search_history') ?? [];

    searchHistoy.remove(keyWord);
    searchHistoy.insert(0, keyWord);
    await prefs.setStringList('search_history', searchHistoy);
    setState(() {});
  }

  void clearSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('search_history');
    setState(() {
      searchHistoy = [];
    });
  }

  void removeItemFromHistory(String keyword) async {
    final prefs = await SharedPreferences.getInstance();
    searchHistoy.remove(keyword);
    await prefs.setStringList('search_history', searchHistoy);
    setState(() {});
  }

  void performSearch(String query) {
    if (query.isNotEmpty) {
      saveSearch(query);
      GoRouter.of(context).push(AppRouter.kSearchResultView, extra: query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.only(left: 17),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios),
              color: Color(0xff292D32),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  CustOmSearch(
                    controller: searchController,
                    onSubmitted: performSearch,
                    onTap: () {
                      performSearch(searchController.text.trim());
                    },
                  ),
                  SizedBox(height: 25),
                  if (searchHistoy.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recent', style: AppStyle.styleBold22(context)),
                        GestureDetector(
                          onTap: () {
                            clearSearchHistory;
                          },
                          child: Text(
                            'Clear All',
                            style: TextStyle(
                              color: Color(0xff233A66),
                              fontSize: getResponsiveFontSize(
                                context,
                                fontSize: 18,
                              ),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchHistoy.length,
                    itemBuilder: (context, index) {
                      final keyword = searchHistoy[index];
                      return SearchItem(
                        onClick: () {
                          searchController.text = keyword;
                          performSearch(keyword);
                        },
                        text: keyword,
                        onTap: () {
                          removeItemFromHistory(keyword);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
