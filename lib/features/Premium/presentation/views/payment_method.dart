import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/custom_button.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Premium/presentation/views/widgets/selection_paymentd.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100),
                  Text(
                    'Choose your credit card',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 20),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30),
                  PaymentSelection(),
                  SizedBox(height: 300),
                  CustomButton(
                    title: 'Add Card Number',
                    verticalPadding: 17,
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kCardNumberPage);
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
