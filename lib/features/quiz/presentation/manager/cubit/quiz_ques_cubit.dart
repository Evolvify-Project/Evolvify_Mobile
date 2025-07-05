import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/quiz/data/models/quiz_model/quiz_model.dart';
import 'package:evolvify/features/quiz/data/repo/quiz_repo_impl.dart';

part 'quiz_ques_state.dart';

class QuizQuesCubit extends Cubit<QuizQuesState> {
  QuizQuesCubit() : super(QuizQuesInitial());
  Future<void> getQuestions({quizId}) async {
    emit(QuizQuesLoading());
    var result = await QuizRepoImpl().getquizQues(quizId:quizId );
    result.fold(
      (failure) {
        emit(QuizQuesFailure(errMessage: failure.errMessge));
      },
      (quizQues) {
        emit(QuizQuesSuccess(quizQues: quizQues));
      },
    );
  }
}
