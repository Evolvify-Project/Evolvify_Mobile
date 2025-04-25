import 'package:evolvify/features/home/presentation/views/widgets/most_watching_Item.dart';
import 'package:flutter/material.dart';

class RecommendedSkillList extends StatelessWidget {
  const RecommendedSkillList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (buildContext, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 23),
            child: MostWatchingItem(),
          );
        },
      ),
    );
  }
}
