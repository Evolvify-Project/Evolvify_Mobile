import 'package:flutter/material.dart';

class CustomLevelofUser extends StatelessWidget {
  const CustomLevelofUser({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.progress,
  });
  final String title, subtitle, icon, progress;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      child: ListTile(
        leading: Image.asset(icon),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff6F6F6F),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 3),
          ],
        ),

        subtitle: Image.asset(progress),
      ),
    );
  }
}
