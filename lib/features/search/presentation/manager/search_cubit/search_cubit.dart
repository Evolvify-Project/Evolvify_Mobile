import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:evolvify/features/search/data/repo/search_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  Future<void> search(String query) async {
    emit(SearchLoading());
    var searchResult = await SearchRepoImpl().search(query);
    searchResult.fold(
      (failure) {
        emit(SearchFailure(errMessage: failure.errMessge));
      },
      (searchResultList) {
        emit(SearchSuccess(courses: searchResultList));
      },
    );
  }
}
