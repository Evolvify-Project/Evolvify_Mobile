import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/widgets/arrow_button.dart';
import 'package:evolvify/core/widgets/cutom_title.dart';
import 'package:evolvify/features/Assessment/presentation/manager/question_cubit/question_cubit.dart';
import 'package:evolvify/features/Assessment/presentation/manager/submit_ques_cubit/submit_ques_cubit.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/circular_row.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/question_section.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/Custom_button_courses_border.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/custom_button_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<QuestionCubit>().getQuestions();
  // }

  // int currentIndex = 0;
  // bool isSelect = false;
  // String? selectedAnswer;

  // String getSectionName(int index) {
  //   if (index < 6)
  //     return "Interview";
  //   else if (index < 12)
  //     return "Communication";
  //   else if (index < 18)
  //     return "Time_Management";
  //   else if (index < 24)
  //     return "Presentation";
  //   else
  //     return "Teamwork";
  // }

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
       body:  Padding(
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
                      // CircularRow(
                      //   progrss: progress,
                      //   num: (currentIndex + 1),
                      //   value: '${currentIndex + 1}/${questions.length}',
                      // ),
                      SizedBox(height: 35),

                      // QuestionSection(
                      //   isSelect: isSelect,
                      //   questionModel: question,
                      //   selectedAnswer: selectedAnswer,
                      //   onSelectedAnswer: (String selected) {
                      //     setState(() {
                      //       isSelect = true;
                      //       selectedAnswer = selected;
                      //     });
                      //     submitCubit.saveAnswer(
                      //       questionCode:
                      //           question.code ?? 'Q${currentIndex + 1}',
                      //       answer: selectedAnswer!,
                      //       section: section,
                      //     );
                      //   },
                      // ),

                      SizedBox(height: 25),

                      Row(
                        children: [
                          Expanded(
                            child: CustomButtonCoursesBorder(
                              text: 'Back',
                              onPressed: () {
                                // if (currentIndex > 0) {
                                //   setState(() {
                                //     currentIndex--;
                                //     isSelect = false;
                                //     selectedAnswer = null;
                                //   });
                                // }
                              },
                            ),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: CustomButtonCourses(
                              text: '',
                              // text:
                              //     currentIndex == questions.length - 1
                              //         ? 'Submit'
                              //         : 'Continue',
                              // onPressed: () {
                              //   if (selectedAnswer == null) return;

                              //   submitCubit.saveAnswer(
                              //     questionCode:
                              //         question.code ?? 'Q${currentIndex + 1}',
                              //     answer: selectedAnswer!,
                              //     section: section,
                              //   );

                              //   if (currentIndex < questions.length - 1) {
                              //     setState(() {
                              //       currentIndex++;
                              //       isSelect = false;
                              //       selectedAnswer = null;
                              //     });
                              //   } else {
                              //     submitCubit.submitAnswers();
                              //   }
                              // },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              )
          
        ,
    );
  }
}
