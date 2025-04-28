
import 'package:evolvify/features/Assessment/data/models/question/questiom_model.dart';

import 'package:evolvify/features/Assessment/presentation/views/widgets/test_button.dart';
import 'package:flutter/material.dart';


class QuestionSection extends StatelessWidget {
  const QuestionSection({super.key, required this.questionModel});
  final QuestionModel questionModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 38),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffE8F1FF),
      ),
      child:
        IntrinsicHeight(
              child: Column(
                children: [
                  Text(
                   questionModel.questionText ?? '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 50),
                  TestButton(text:(questionModel.choices!.a )     ?? '', ),
                  SizedBox(height: 12),
                  TestButton(
                    text: (questionModel.choices!.b )     ?? '', 
                  ),
                  SizedBox(height: 12),
                  TestButton(
                    text:
                        (questionModel.choices!.c )     ?? '', 
                  ),
                  SizedBox(height: 12),
                  TestButton(text:(questionModel.choices!.d )     ?? '', ),
                ],
              ),
            )
          
      );
    
  }
}
