import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/customSearch.dart';
import 'package:evolvify/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:evolvify/features/search/presentation/views/widgets/search_result_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResultView extends StatefulWidget {
  const SearchResultView({super.key, required this.searchquery});
  final String searchquery;

  @override
  State<SearchResultView> createState() => _SearchResultViewState();
}

class _SearchResultViewState extends State<SearchResultView> {
  TextEditingController searchController = TextEditingController();
  void initState() {
    super.initState();
    searchController = TextEditingController(text: widget.searchquery);

    context.read<SearchCubit>().search(widget.searchquery);
    context.read<SearchCubit>().setQuery(widget.searchquery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  CustOmSearch(
                    hint: widget.searchquery,
                    controller: searchController,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        context.read<SearchCubit>().search(value);
                      }
                    },
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your search result ',
                        style: AppStyle.styleBold22(context),
                      ),

                      GestureDetector(
                        onTap: () {
                          context.read<SearchCubit>().setQuery(
                            widget.searchquery,
                          );
                          GoRouter.of(context).push(AppRouter.kFilterView);
                        },
                        child: Image.asset(Assets.imagesSetting),
                      ),
                    ],
                  ),
                  SearchResultList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
