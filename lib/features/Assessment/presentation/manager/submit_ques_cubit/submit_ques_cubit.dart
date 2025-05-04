import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:evolvify/features/Assessment/data/models/question/skill_result.dart';
import 'package:evolvify/features/Assessment/data/repo/assessment_repo_impl.dart';

part 'submit_ques_state.dart';

class SubmitQuesCubit extends Cubit<SubmitQuesState> {
  SubmitQuesCubit() : super(SubmitQuesInitial());

  Map<String, Map<String, String>> userAnswers = {
    'interview': {'Q1': '', 'Q2': '', 'Q3': '', 'Q4': '', 'Q5': '', 'Q6': ''},
    'communication': {
      'Q1': '',
      'Q2': '',
      'Q3': '',
      'Q4': '',
      'Q5': '',
      'Q6': '',
    },
    'time_management': {
      'Q1': '',
      'Q2': '',
      'Q3': '',
      'Q4': '',
      'Q5': '',
      'Q6': '',
    },
    'presentation': {
      'Q1': '',
      'Q2': '',
      'Q3': '',
      'Q4': '',
      'Q5': '',
      'Q6': '',
    },
    'teamwork': {'Q1': '', 'Q2': '', 'Q3': '', 'Q4': '', 'Q5': '', 'Q6': ''},
  };

  void saveAnswer({
    required String section,
    required String questionCode,
    required String answer,
  }) {
    // تأكد من أن القسم الذي يتم تمريره موجود في الخريطة
    section = section.toLowerCase();
    if (userAnswers.containsKey(section)) {
      userAnswers[section]![questionCode] = answer;
    } else {
      print('Invalid section: $section');
    }
  }

  Future<void> submitAnswers() async {
    emit(SubmitQuesLoading());

    // استخدام repo لإرسال البيانات
    var result = await AssessmentRepoImpl().submitAnswers(userAnswers);
    result.fold(
      (failure) {
        emit(SubmitQuesFailure(errMessage: failure.errMessge));
      },
      (results) {
        emit(SubmitQuesSucess(results: results));
      },
    );
  }
}
