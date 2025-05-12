import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/customSearch.dart';
import 'package:evolvify/features/search/presentation/views/widgets/search_result_list.dart';


import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  TextEditingController searchController = TextEditingController();
  void saveSearch(String keyWord) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> searchHistoy = prefs.getStringList('search_history') ?? [];
    if (searchHistoy.contains(keyWord)) {
      searchHistoy.insert(0, keyWord);
      prefs.getStringList('search_history');
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
                    onTap: () {
                      final query = searchController.text.trim();
                      if (query.isNotEmpty) {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.kSearchResultView, extra: query);
                      }
                    },
                    controller: searchController,
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent', style: AppStyle.styleBold22(context)),
                      Text(
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
                    ],
                  ),

               
                  SearchResultList()
                    
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
