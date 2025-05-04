import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/features/Assessment/data/models/question/skill_result.dart';
import 'package:flutter/material.dart';

Widget buildSkillTile(SkillResult skillResult) {
  Color color;
  String image;
  double progress;

  switch (skillResult.level.toLowerCase()) {
    case 'advanced':
      color = Colors.green;
      image = Assets.imagesAdvanced;
      progress = 1.0;
      break;
    case 'intermediate':
      color = Colors.amber;
      image = Assets.imagesInter;
      progress = 0.6;
      break;
    default:
      color = Colors.red;
      image = Assets.imagesBegginer;
      progress = 0.2;
  }

  return Container(
    padding: EdgeInsets.only(bottom: 3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9),
      color: Colors.white,
    ),
    child: ListTile(
      leading: Image.asset(image),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${skillResult.skill} Skills ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Text(
            skillResult.level,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff6F6F6F),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 3),
        ],
      ),

      subtitle: LinearProgressIndicator(
        value: progress,
        color: color,
        backgroundColor: Colors.grey[300],
        minHeight: 6,
      ),
    ),
  );
}
