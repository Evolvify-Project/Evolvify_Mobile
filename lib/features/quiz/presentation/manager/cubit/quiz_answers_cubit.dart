import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/quiz/data/repo/quiz_repo_impl.dart';
part 'quiz_answers_state.dart';

class QuizAnswersCubit extends Cubit<QuizAnswersState> {
  QuizAnswersCubit() : super(QuizAnswersInitial());

  Future<void> submitquizAnswers(quizAttemptId, answerId) async {
    emit(QuizAnswersloading());

    var result = await QuizRepoImpl().submitquizAnswers(
      quizAttemptId,
      answerId,
    );
    result.fold(
      (failure) {
        emit(QuizAnswersFailure(errMessage: failure.errMessge));
      },
      (results) {
        emit(QuizAnswersSuccess());
      },
    );
  }
}
