import 'package:evolvify/features/search/presentation/views/widgets/filter_button.dart';
import 'package:flutter/material.dart';

class LevelListView extends StatelessWidget {
  LevelListView({super.key});

  final List levelList = ['All', 'Beginner', 'Intermediate', 'Advanced'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: levelList.length,
        itemBuilder: (context, index) {
          return FilterButton(text: levelList[index]);
        },
      ),
    );
  }
}
