
import 'package:evolvify/features/AI-Assessment/presentation/views/widgets/PremiumSection.dart';
import 'package:flutter/material.dart';

class AiassessmentView extends StatelessWidget {
  const AiassessmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),
          UpgradetoPremiumSection(),
        ],
      ),
    );
  }
}
