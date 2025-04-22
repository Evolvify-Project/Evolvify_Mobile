import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/customSearch.dart';
import 'package:evolvify/features/search/presentation/views/widgets/search_Item_listView.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

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
                  CustOmSearch(),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent', style: AppStyle.styleBold22),
                      Text(
                        'Clear All',
                        style: TextStyle(
                          color: Color(0xff233A66),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),

                  SearchItemListView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
