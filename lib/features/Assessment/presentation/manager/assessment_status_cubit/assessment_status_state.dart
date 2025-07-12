part of 'assessment_status_cubit.dart';

sealed class AssessmentStatusState extends Equatable {
  const AssessmentStatusState();

  @override
  List<Object> get props => [];
}

final class AssessmentStatusInitial extends AssessmentStatusState {}

final class AssessmentStatusLoading extends AssessmentStatusState {}

final class AssessmentStatusSuccess extends AssessmentStatusState {
  final bool hasCompleted;

  const AssessmentStatusSuccess({required this.hasCompleted});

  @override
  List<Object> get props => [hasCompleted];
}

final class AssessmentStatusFailure extends AssessmentStatusState {
  final String errMessage;

  const AssessmentStatusFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage];
}
