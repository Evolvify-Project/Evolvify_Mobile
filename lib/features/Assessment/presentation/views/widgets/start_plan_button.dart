import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/core/widgets/customSearch.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPlanButton extends StatelessWidget {
  const StartPlanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,

      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          backgroundColor: AppColors.kPrimaryColor,
        ),
        onPressed: () {
          GoRouter.of(context).push(AppRouter.kRecommendedContentView);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Center(
            child: Row(
              children: [
                Text(
                  'Start Your Learning Plan',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 35,
                  width: 35,
                  decoration: ShapeDecoration(
                    shape: OvalBorder(
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  child: Transform.rotate(
                    angle: -1.57079633 * 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
