import 'package:evolvify/features/Assessment/data/models/courses_model.dart';

import 'package:evolvify/features/home/presentation/views/widgets/most_watching_Item.dart';
import 'package:evolvify/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SearchSuccess) {
          final List<CoursesModel> searchResultList = state.courses;
          print(searchResultList);
          return GridView.builder(
            shrinkWrap: true,
            itemCount: searchResultList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              return MostWatchingItem(coursesModel: searchResultList[index]);
            },
          );
  
        } else if (state is SearchFailure) {
          return Center(child: Text(state.errMessage.toString()));
        }
        return Center(child: Text('No search Result.'));
      },
    );
  }
}
