import 'dart:async';

import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_router.dart';

import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class LogoView extends StatefulWidget {
  const LogoView({super.key});

  @override
  State<LogoView> createState() => _LogoViewState();
}

class _LogoViewState extends State<LogoView> {
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.kOnBordingView);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SvgPicture.asset(Assets.imagesLogo2),
            SizedBox(height: 24),
            Text(
              'Evolvify',
              style: AppStyle.styleBold52.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
