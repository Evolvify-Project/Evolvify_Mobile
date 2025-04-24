import 'package:evolvify/features/search/presentation/views/widgets/filter_button.dart';
import 'package:flutter/material.dart';

class SortList extends StatelessWidget {
  SortList({super.key});

  @override
  final List sortList = ['All', 'Newest', 'Most Popular'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sortList.length,
        itemBuilder: (context, index) {
          return FilterButton(text: sortList[index]);
        },
      ),
    );
  }
}
