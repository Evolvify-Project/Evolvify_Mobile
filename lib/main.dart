import 'package:device_preview/device_preview.dart';
import 'package:evolvify/features/auth/presentation/views/forget_password_view.dart';
import 'package:evolvify/features/auth/presentation/views/login_view.dart';
import 'package:evolvify/features/auth/presentation/views/sign_up_view.dart';
import 'package:evolvify/features/auth/presentation/views/verify_password_view.dart';
import 'package:evolvify/features/auth/presentation/views/widgets/Verification_password.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(enabled: true, builder: (context) => const EvolvifyApp()),
  );
}

class EvolvifyApp extends StatelessWidget {
  const EvolvifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: VerifyPasswordView(),
    );
  }
}
