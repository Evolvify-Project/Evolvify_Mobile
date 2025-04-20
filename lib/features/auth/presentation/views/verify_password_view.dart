import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart'; 
import 'package:evolvify/core/widgets/custom_arrow_back.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/Verification_password.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
class VerifyPasswordView extends StatelessWidget {
  const VerifyPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 53, child: CustomArrowBack()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 55),
                Text(
                  'Verification',
                  style: AppStyle.styleMedium28.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 24),

                SvgPicture.asset(Assets.imagesSmallEvolvify),
                const SizedBox(height: 11),
                Text(
                  'Evolvify',
                  style: AppStyle.styleBold52.copyWith(fontSize: 24),
                ),

                SizedBox(height: 52),
                VerityPassword(),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
