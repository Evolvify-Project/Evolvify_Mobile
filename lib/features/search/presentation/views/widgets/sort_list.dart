import 'package:evolvify/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:evolvify/features/search/presentation/views/widgets/filter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortList extends StatefulWidget {
  const SortList({super.key});

  @override
  State<SortList> createState() => _SortListState();
}

class _SortListState extends State<SortList> {
  @override
  final List sortList = ['All', 'Newest', 'Most Popular'];
  int? isSelectd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sortList.length,
        itemBuilder: (context, index) {
          return FilterButton(
            isSelect: isSelectd == index,
            text: sortList[index],
            onTap: () {
              setState(() {
                isSelectd = index;
              });
              int? sortValue = switch (sortList[index]) {
                'All' => 1,
                'Newest' => 2,
                'Most Popular' => 3,
                _ => null,
              };
              if (sortValue != null) {
                context.read<SearchCubit>().setSortBy(sortValue);
              }
            },
          );
        },
      ),
    );
  }
}
