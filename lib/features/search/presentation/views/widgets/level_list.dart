import 'package:evolvify/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:evolvify/features/search/presentation/views/widgets/filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LevelListView extends StatefulWidget {
  const LevelListView({super.key});

  @override
  State<LevelListView> createState() => _LevelListViewState();
}

class _LevelListViewState extends State<LevelListView> {
  final List levelList = ['All', 'Beginner', 'Intermediate', 'Advanced'];
  int? isSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: levelList.length,
        itemBuilder: (context, index) {
          return FilterButton(
            isSelect: isSelectedIndex == index,
            text: levelList[index],
            onTap: () {
              setState(() {
                isSelectedIndex = index;
              });

              int? levelValue = switch (levelList[index]) {
                'Beginner' => 1,
                'Intermediate' => 2,
                'Advanced' => 3,
                _ => null,
              };
              if (levelValue != null) {
                context.read<SearchCubit>().setLevel(levelValue);
              }
            },
          );
        },
      ),
    );
  }
}
