import 'package:evolvify/features/home/presentation/views/widgets/most_watching_Item.dart'
    show MostWatchingItem;
import 'package:flutter/material.dart';

class MostSkillsListView extends StatelessWidget {
  const MostSkillsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
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
      ),
    );
  }
}
