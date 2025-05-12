import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:evolvify/features/search/data/repo/search_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
    String currentQuery = '';
  int? selectedLevel;     
  int? sortBy;            
  int? skillId;          

  void setQuery(String query) {
    currentQuery = query;
  }

  void setLevel(int level) {
    selectedLevel = level;
  }

  void setSortBy(int sort) {
    sortBy = sort;
  }

  void setSkillId(int id) {
   skillId = id;
  }

  void applyFilters() {
   search(
    currentQuery,
    sortBy: sortBy ?? 1,
    skillId: skillId,
    level: selectedLevel,
  );
  }
  Future<void> search(
    String query, {
    int pageNumber = 1,
    int pageSize = 10,
    int sortBy = 1,
    int? skillId,
    int? level,
  }) async {
    emit(SearchLoading());
    var searchResult = await SearchRepoImpl().search(
      query,
      pageNumber: pageNumber,
      pageSize: pageSize,
      sortBy: sortBy,
      skillId: skillId,
      level: level,
    );
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
