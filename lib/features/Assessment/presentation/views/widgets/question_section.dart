
import 'package:evolvify/features/Assessment/presentation/views/widgets/test_button.dart';
import 'package:flutter/material.dart';

class QuestionSection extends StatelessWidget {
  const QuestionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffE8F1FF),
      ),
      child: Column(
        children: [
          Text(
            'What is the most important skill \n to develop for job interviews?',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 60),
          TestButton(text: ' Researching the company '),
          SizedBox(height: 12),
          TestButton(text: ' Researching the company '),
          SizedBox(height: 12),
          TestButton(text: ' Researching the company '),
          SizedBox(height: 12),
          TestButton(text: ' Researching the company '),
        ],
      ),
    );
  }
}
