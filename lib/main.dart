import 'package:device_preview/device_preview.dart';
import 'package:evolvify/core/utils/app_router.dart';
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
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'PlusJakartaSans',
      ),
    );
  }
}
