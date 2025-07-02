import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart' show CustomButton;
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Premium/presentation/views/widgets/card_details.dart';
import 'package:flutter/material.dart';

class CardNumberPage extends StatelessWidget {
  const CardNumberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CutsomArrowios(),
                Text(
                  'Payment method',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontSize: getResponsiveFontSize(context, fontSize: 25),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(''),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60),

                  Image.asset(Assets.imagesMasterCard),
                  SizedBox(height: 40),
                  CardFormScreen(),
                  SizedBox(height: 150),
                  CustomButton(
                    title: 'Confirm',
                    verticalPadding: 17,
                    onTap: () {
                      // GoRouter.of(context).push(AppRouter.kCardNumberPage);
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
