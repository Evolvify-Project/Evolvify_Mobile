import 'package:evolvify/features/search/presentation/views/widgets/search_item.dart';
import 'package:flutter/material.dart';

class SearchItemListView extends StatelessWidget {
  const SearchItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, build) {
        return SearchItem(text: 'interview');
      },
    );
  }
}
