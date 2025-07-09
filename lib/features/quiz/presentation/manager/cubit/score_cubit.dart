import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/quiz/data/models/quiz_score_model/score.dart';
import 'package:evolvify/features/quiz/data/repo/quiz_repo_impl.dart';
part 'score_state.dart';

class ScoreCubit extends Cubit<ScoreState> {
  ScoreCubit() : super(ScoreInitial());

  Future<void> getScore(quizAttemptId) async {
    emit((ScoreLoading()));

    var result = await QuizRepoImpl().getScore(quizAttemptId: quizAttemptId);
    result.fold(
      (failure) {
        emit(ScoreFailure(errMessage: failure.errMessge));
      },
      (score) {
        emit(ScoreSuccess(score: score));
      },
    );
  }
}
