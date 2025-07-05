import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/quiz/data/repo/quiz_repo_impl.dart';

part 'quiz_attempts_state.dart';

class QuizAttemptsCubit extends Cubit<QuizAttemptsState> {
  QuizAttemptsCubit() : super(QuizAttemptsInitial());

  Future<void> quizAttempts(String quizId) async {
    var result = await QuizRepoImpl().quizAttempts(quizId: quizId);
    result.fold(
      (failure) {
        return emit(QuizAttemptsFailure(errMessage: failure.errMessge));
      },
      (url) {
        emit(QuizAttemptsSuccess());
      },
    );
  }
}
