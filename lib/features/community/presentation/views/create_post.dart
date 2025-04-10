import 'package:evolvify/core/utils/app_style.dart';

import 'package:evolvify/features/community/presentation/views/widgets/custom_botton_Post.dart';
import 'package:evolvify/features/community/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: AppStyle.styleSemiBold24.copyWith(fontSize: 14),
                ),
              ),
            ),
            SizedBox(height: 12),
            CustomTextFormField(
              onChanged: (value){
                
              },
              mixLine: 12,
              hint: 'What do you think right now?',

            ),
            SizedBox(height: 18),
            CustomBottonPost(),
          ],
        ),
      ),
    );
  }
}
