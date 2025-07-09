part of 'fetch_allcomments_cubit.dart';

sealed class FetchAllcommentsState extends Equatable {
  const FetchAllcommentsState();

  @override
  List<Object> get props => [];
}

final class FetchAllcommentsInitial extends FetchAllcommentsState {}

final class FetchAllcommentsLoading extends FetchAllcommentsState {}

final class FetchAllcommentsFailure extends FetchAllcommentsState {
  final String errMessage;

  const FetchAllcommentsFailure({required this.errMessage});
}

final class FetchAllcommentsSuccess extends FetchAllcommentsState {
  final List<CommentModel2> allComments;

 const FetchAllcommentsSuccess({required this.allComments});
}
