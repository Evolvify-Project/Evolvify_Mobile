import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Assessment/data/repo/assessment_repo_impl.dart';

part 'assessment_status_state.dart';

class AssessmentStatusCubit extends Cubit<AssessmentStatusState> {
  AssessmentStatusCubit() : super(AssessmentStatusInitial());

  Future<void> checkAssessmentStatus() async {
    if (!isClosed) {
      emit(AssessmentStatusLoading());
    }

    var result = await AssessmentRepoImpl().hasCompletedAssessment();

    if (!isClosed) {
      result.fold(
        (failure) {
          emit(AssessmentStatusFailure(errMessage: failure.errMessge));
        },
        (hasCompleted) {
          emit(AssessmentStatusSuccess(hasCompleted: hasCompleted));
        },
      );
    }
  }
}
