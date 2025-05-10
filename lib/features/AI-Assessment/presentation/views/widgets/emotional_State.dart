import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';

@override
void showEmotionalState(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 170,
          top: 30,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 30, bottom: 20, left: 14, right: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(60),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Image.asset(Assets.imagesEmotion),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Emotional State',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: getResponsiveFontSize(
                              context,
                              fontSize: 24,
                            ),
                          ),
                        ),
                        Text(
                          'Your emotional state appears \n balanced',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: getResponsiveFontSize(
                              context,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Primary: neutral',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: getResponsiveFontSize(context, fontSize: 19),
                    ),
                  ),
                  Text(
                    'Confidence:21.3%',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: getResponsiveFontSize(context, fontSize: 19),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
