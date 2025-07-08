import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/arrow_button.dart';
import 'package:evolvify/core/widgets/cutom_title.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/circular_row.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/Custom_button_courses_border.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/custom_button_courses.dart';
import 'package:evolvify/features/quiz/presentation/manager/cubit/quiz_answers_cubit.dart';
import 'package:evolvify/features/quiz/presentation/manager/cubit/quiz_attempts_cubit.dart';
import 'package:evolvify/features/quiz/presentation/manager/cubit/quiz_ques_cubit.dart';
import 'package:evolvify/features/quiz/presentation/manager/cubit/score_cubit.dart';
import 'package:evolvify/features/quiz/presentation/views/show_Score.dart';
import 'package:evolvify/features/quiz/presentation/views/widgets/quizQues_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  @override
  void initState() {
    context.read<QuizAttemptsCubit>().quizAttempts(1);
  }

  int currentIndex = 0;
  bool isSelect = false;
  Map<int, int> userAnswers = {};
  Map<int, bool> isSelectedMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ScoreCubit, ScoreState>(
        listener: (context, state) {
          if (state is ScoreSuccess) {
            final scoreItem = state.score;
            showScore(context, scoreItem);
          } else if (state is ScoreFailure) {
            Text(
              state.errMessage,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 18),
              ),
            );
          } else if (state is ScoreLoading) {
            Center(child: CircularProgressIndicator());
          }
        },
        child: BlocBuilder<QuizQuesCubit, QuizQuesState>(
          builder: (context, state) {
            if (state is QuizQuesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is QuizQuesSuccess) {
              final quizQuesList = state.quizQues;
              final quizQue = quizQuesList[currentIndex];

              final progress = (currentIndex + 1) / quizQuesList.length;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        children: [
                          ArrowBackButton(),
                          Spacer(flex: 1),
                          CutomTitle(title: 'Test your skills     '),
                          Spacer(flex: 1),
                        ],
                      ),
                      SizedBox(height: 25),
                      CircularRow(
                        progrss: progress,
                        num: currentIndex + 1,
                        value: '${currentIndex + 1}/${quizQuesList.length}',
                      ),
                      SizedBox(height: 35),

                      QuizQuesSection(
                        selectedAnswerId: userAnswers[quizQue.id!],
                        onAnswerSelected: (answerId) {
                          setState(() {
                            userAnswers[quizQue.id!] = answerId;
                          });
                        },
                        quizModel: quizQue,
                      ),
                      SizedBox(height: 25),

                      Row(
                        children: [
                          Expanded(
                            child: CustomButtonCoursesBorder(
                              text: 'Back',
                              onPressed: () {
                                if (currentIndex > 0) {
                                  setState(() {
                                    currentIndex--;
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: CustomButtonCourses(
                              text:
                                  currentIndex == quizQuesList.length - 1
                                      ? 'Submit'
                                      : 'Continue',
                              onPressed: () {
                                final quizAttemptId =
                                    context
                                        .read<QuizAttemptsCubit>()
                                        .quizAttemptId;
                                final questionId = quizQue.id!;
                                final selectedAnswer = userAnswers[questionId];

                                if (selectedAnswer == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Please select an answer.'),
                                    ),
                                  );
                                  return;
                                }

                                context
                                    .read<QuizAnswersCubit>()
                                    .submitquizAnswers(
                                      quizAttemptId,
                                      selectedAnswer,
                                    );

                                if (currentIndex < quizQuesList.length - 1) {
                                  setState(() {
                                    currentIndex++;
                                  });
                                } else {
                                  context.read<ScoreCubit>().getScore(
                                    quizAttemptId,
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            } else if (state is QuizQuesFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: TextStyle(
                    fontSize: getResponsiveFontSize(context, fontSize: 18),
                  ),
                ),
              );
            } else {
              return Center(child: Text('No questions available.'));
            }
          },
        ),
      ),
    );
  }
}
