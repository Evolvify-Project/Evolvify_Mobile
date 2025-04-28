import 'dart:developer';

import 'package:evolvify/core/widgets/arrow_button.dart';
import 'package:evolvify/core/widgets/cutom_title.dart';
import 'package:evolvify/features/Assessment/data/models/question/questiom_model.dart';
import 'package:evolvify/features/Assessment/presentation/manager/question_cubit/question_cubit.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/circular_row.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/question_section.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/Custom_button_courses_border.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/custom_button_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  @override
  void initState() {
    super.initState();
    context.read<QuestionCubit>().getQuestions();
  }

  QuestionModel? questionModel;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<QuestionCubit, QuestionState>(
        builder: (context, state) {
          if (state is QuestionLosding) {
            return Center(child: CircularProgressIndicator());
          } else if (state is QuestionSuccess) {
            final questions = state.questionsList;
            final question = questions[currentIndex];

            double progress = (currentIndex + 1) / questions.length;
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
                      num: (currentIndex + 1),
                      value:
                          '${(currentIndex + 1).toInt()}/${questions.length}',
                    ),
                    SizedBox(height: 35),
                    QuestionSection(questionModel: question),
                    // SizedBox(height: 75),
                    SizedBox(height: 25),

                    Row(
                      children: [
                        Expanded(
                          child: CustomButtonCoursesBorder(
                            text: 'Back',
                            onPressed: () {
                              currentIndex > 0
                                  ? setState(() {
                                    currentIndex--;
                                    log('Updated progress: $progress');
                                  })
                                  : null;
                            },
                          ),
                        ),
                        SizedBox(width: 30),
                        Expanded(
                          child: CustomButtonCourses(
                            text: 'Continue',
                            onPressed: () {
                              currentIndex < questions.length - 1
                                  ? setState(() {
                                    currentIndex++;
                                    print('Updated progress: $progress');
                                  })
                                  : null;
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
          } else if (state is QuestionFailure) {
            return Center(
              child: Text(state.errMessage, style: TextStyle(fontSize: 18)),
            );
          }
          return Center(child: Text('No posts available.'));
        },
      ),
    );
  }
}
