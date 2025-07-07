import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';

import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showCourseComplete(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        iconPadding: EdgeInsets.only(top: 30, bottom: 20),
        backgroundColor: Colors.white,
        icon: Image.asset(Assets.imagesCourseComplete),
        title: Text(
          'Course Completed',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 22),
            fontWeight: FontWeight.w600,
            color: Color(0xff202244),
          ),
        ),
        contentPadding: EdgeInsets.only(top: 6, bottom: 30),
        content: Text(
          'It\'s time to test your progress.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 14),
            fontWeight: FontWeight.w500,
            color: Color(0xff545454),
          ),
        ),
        actions: [
          SizedBox(
            height: 60,
            width: 225,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
                backgroundColor: AppColors.kPrimaryColor,
              ),
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kQuizView);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Test Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, fontSize: 20),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 48,
                    width: 48,
                    decoration: ShapeDecoration(
                      shape: OvalBorder(),
                      color: Colors.white,
                    ),
                    child: Transform.rotate(
                      angle: 1.57079633 * 2,
                      child: Icon(
                        Icons.arrow_back,
                        color: AppColors.kPrimaryColor,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
