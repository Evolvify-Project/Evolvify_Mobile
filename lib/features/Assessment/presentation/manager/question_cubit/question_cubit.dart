import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Assessment/data/repo/assessment_repo_impl.dart';

part 'question_state.dart';

class QuestionCubit extends Cubit<QuestionState> {
  QuestionCubit() : super(QuestionInitial());

  Future<void> getQuestions() async {
    emit(QuestionLosding());
    var questions = await AssessmentRepoImpl().getQuestions();
    questions.fold(
      (failure) {
        emit(QuestionFailure(errMessage: failure.errMessge));
      },
      (questions) {
        emit(QuestionSuccess(questionsList: questions));
      },
    );
  }
}
