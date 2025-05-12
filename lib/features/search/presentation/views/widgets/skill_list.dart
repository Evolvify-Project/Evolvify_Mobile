import 'package:evolvify/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:evolvify/features/search/presentation/views/widgets/filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SkillList extends StatefulWidget {
  SkillList({super.key});

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  @override
  final List skillList = [
    'Communication',
    "Interview",
    "Teamwork",
    "Presentation",
    "Time Management",
  ];
  int? isSelected;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: skillList.length,
        itemBuilder: (context, index) {
          return FilterButton(
            isSelect: isSelected == index,
            text: skillList[index],
            onTap: () {
              setState(() {
                isSelected = index;
              });
              int? skillIdValue = switch (skillList[index]) {
                'Communication' => 1,
                "Interview" => 2,
                "Teamwork" => 3,
                "Presentation" => 4,
                "Time Management" => 5,
                _ => null,
              };
              if (skillIdValue != null) {
                context.read<SearchCubit>().setSkillId(skillIdValue);
              }
            },
          );
        },
      ),
    );
  }
}
