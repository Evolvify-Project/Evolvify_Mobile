import 'package:flutter/material.dart';

class TitleOfSkillPlan extends StatelessWidget {
  const TitleOfSkillPlan({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 4, bottom: 4, right: 25),
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
