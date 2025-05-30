import 'package:cached_network_image/cached_network_image.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/test_button.dart';
import 'package:evolvify/features/splash%20screen/widgets/custom_button_border.dart';
import 'package:flutter/material.dart';

class ShowCourseText extends StatelessWidget {
  const ShowCourseText({super.key});

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

                      fontSize: getResponsiveFontSize(context, fontSize: 21),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 2 / 1,
                    child: CachedNetworkImage(
                      imageUrl: '',

                      fit: BoxFit.fill,
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(
                    'Interviews can be nerve-wracking, but with the right preparation, you can walk in feeling confident and ready to shine. In this article, we’ll explore key tips to help you succeed',
                    style: TextStyle(
                      color: Colors.black,

                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 20),
                  TestButton(
                    text:
                        'Tip: Research the company and prepare specific questions about the role. This shows interest and initiative.',
                    onPressed: () {},
                    isSelected: true,
                  ),
                  SizedBox(height: 20),
                  CustomButtonBorder(
                    title: 'Continue to next lesson',
                    verticalPadding: 13,
                  ),
                  SizedBox(height: 20),
                  CustomButton(title: 'Quick Quiz', verticalPadding: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
