import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/test_button.dart';
import 'package:evolvify/features/quiz/data/models/quiz_model/answer.dart';
import 'package:evolvify/features/quiz/data/models/quiz_model/quiz_model.dart';
import 'package:flutter/material.dart';

class QuizQuesSection extends StatelessWidget {
  const QuizQuesSection({
    super.key,
    required this.selectedAnswerId,
    required this.quizModel,
    required this.onAnswerSelected,
  });

  final QuizModel quizModel;
  final int? selectedAnswerId;
  final void Function(int answerId) onAnswerSelected;

  @override
  Widget build(BuildContext context) {
    List<Answer> answers = quizModel.answers ?? [];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffE8F1FF),
      ),
      child: Column(
        children: [
          Text(
            quizModel.questionText ?? '',
            style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 20),
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 50),
          Column(
            children:
                answers.map((answer) {
                  final isSelected = selectedAnswerId == answer.id;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: TestButton(
                      text: answer.answerText ?? '',
                      isSelected: isSelected,
                      onPressed: () => onAnswerSelected(answer.id!),
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
