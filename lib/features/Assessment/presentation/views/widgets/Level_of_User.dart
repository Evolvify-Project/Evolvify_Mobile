import 'package:evolvify/features/Assessment/data/models/question/skill_result.dart';
import 'package:flutter/material.dart';

Widget buildSkillTile(SkillResult skillResult) {
  Color color;
  Icon icon;
  double progress;

  switch (skillResult.level.toLowerCase()) {
    case 'advanced':
      color = Colors.green;
      icon = const Icon(Icons.check_circle, color: Colors.green);
      progress = 1.0;
      break;
    case 'intermediate':
      color = Colors.amber;
      icon = const Icon(Icons.warning_amber, color: Colors.amber);
      progress = 0.6;
      break;
    default:
      color = Colors.red;
      icon = const Icon(Icons.cancel, color: Colors.red);
      progress = 0.2;
  }

  return Container(
    padding: EdgeInsets.only(bottom: 3),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(9),
      color: Colors.white,
    ),
    child: ListTile(
      leading: icon,
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

// Widget _buildSkillTile(SkillResult result) {
//   Color color;
//   Icon icon;
//   double progress;

//   switch (result.level.toLowerCase()) {
//     case 'advanced':
//       color = Colors.green;
//       icon = const Icon(Icons.check_circle, color: Colors.green);
//       progress = 1.0;
//       break;
//     case 'intermediate':
//       color = Colors.amber;
//       icon = const Icon(Icons.warning_amber, color: Colors.amber);
//       progress = 0.6;
//       break;
//     default:
//       color = Colors.red;
//       icon = const Icon(Icons.cancel, color: Colors.red);
//       progress = 0.2;
//   }

//   return Card(
//     margin: const EdgeInsets.symmetric(vertical: 8),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     child: Padding(
//       padding: const EdgeInsets.all(12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               icon,
//               const SizedBox(width: 8),
//               Text(
//                 '${result.skill} Skills',
//                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               const Spacer(),
//               Text(
//                 result.level,
//                 style: TextStyle(fontSize: 14, color: color),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           LinearProgressIndicator(
//             value: progress,
//             color: color,
//             backgroundColor: Colors.grey[300],
//             minHeight: 6,
//           )
//         ],
//       ),
//     ),
//   );
// }
