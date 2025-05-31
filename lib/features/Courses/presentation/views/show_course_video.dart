import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Courses/presentation/views/widgets/details_of_course.dart';
import 'package:evolvify/features/splash%20screen/widgets/custom_button_border.dart';
import 'package:flutter/material.dart';


class ShowCourse extends StatelessWidget {
  const ShowCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 22),
            CutsomArrowios(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),

                        Text(
                          'Course Overview',
                          style: TextStyle(
                            color: AppColors.kPrimaryColor,

                            fontSize: getResponsiveFontSize(
                              context,
                              fontSize: 21,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                       DetailsOfCourse(),
                      
                        SizedBox(height: 20),
                        CustomButtonBorder(
                          title: 'Continue to next lesson',
                          verticalPadding: 13,
                        ),
                        SizedBox(height: 20),
                        CustomButton(title: 'Quick Quiz', verticalPadding: 14),
                      ],
                    )
               
              ),
            
          ],
        ),
      ),
    );
  }
}
