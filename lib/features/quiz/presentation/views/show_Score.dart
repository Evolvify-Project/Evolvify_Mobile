import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/quiz/data/models/quiz_score_model/score.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void showScore(BuildContext context, Score score) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        iconPadding: EdgeInsets.only(top: 30, bottom: 20),
        backgroundColor: Colors.white,
        icon: Image.asset(Assets.imagesDdone, width: 100, height: 100),
        title: Text(
          'Quiz Score',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 22),
            fontWeight: FontWeight.w600,
            color: Color(0xff202244),
          ),
        ),

        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total Questions :${score.total}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 18),
                fontWeight: FontWeight.w500,
                color: Color(0xff545454),
              ),
            ),
            Text(
              'Correct Answer :${score.correct! - 15} ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 18),
                fontWeight: FontWeight.w500,
                color: Color(0xff545454),
              ),
            ),
          ],
        ),
        actions: [
          Center(
            child: SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                  backgroundColor: AppColors.kPrimaryColor,
                ),
                onPressed: () {
                  GoRouter.of(
                    context,
                  ).push(AppRouter.kCustomBottomNavigationBar);
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'Back to Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveFontSize(context, fontSize: 16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
