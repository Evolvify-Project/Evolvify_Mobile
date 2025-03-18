import 'package:evolvify/features/home/presentation/views/widgets/Ccustom_header_homePage.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(children: [SizedBox(height: 28), CustomHeaderHomePage()]),
      ),
    );
  }
}
