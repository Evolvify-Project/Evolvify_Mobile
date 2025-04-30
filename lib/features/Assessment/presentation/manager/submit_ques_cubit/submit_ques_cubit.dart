import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/core/errors/failures.dart';
import 'package:evolvify/core/utils/api_services.dart';
import 'package:evolvify/features/Assessment/data/repo/assessment_repo_impl.dart';

part 'submit_ques_state.dart';

class SubmitQuesCubit extends Cubit<SubmitQuesState> {
  SubmitQuesCubit() : super(SubmitQuesInitial());
 final Map<String, String> userAnswers = {};
   
   void saveAnswer({required String questionId,required String answer}) {
    userAnswers[questionId] = answer;
  }
  Future<void> submitAnswers() async {
    emit(SubmitQuesLoading());

    var result = await AssessmentRepoImpl().submitAnswers(userAnswers);
    result.fold(
      (failure) {
        emit(SubmitQuesFailure(errMessage: failure.errMessge));
      },
      (sucess) {
        emit(SubmitQuesSucess());
      },
    );
  }
}
