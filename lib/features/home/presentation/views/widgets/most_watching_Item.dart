import 'package:awesome_icons/awesome_icons.dart';
import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class MostWatchingItem extends StatelessWidget {
  const MostWatchingItem({super.key, required this.coursesModel});
  final CoursesModel coursesModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image.network(coursesModel.imageUrl ?? ''),
        SizedBox(height: 15),
        Text(
          coursesModel.title ?? '',

          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
        ),
        SizedBox(height: 5),
        Text(
          coursesModel.level ?? '',
          style: TextStyle(color: Color(0xffFF001E)),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Text(
              '4.0',
              style: TextStyle(color: Color(0xff888C94), fontSize: 11),
            ),
            SizedBox(width: 6),
            const Icon(
              FontAwesomeIcons.solidStar,
              color: Color(0xffFFA927),
              size: 14,
            ),
            SizedBox(width: 30),
            Text(
              '(4051)',
              style: TextStyle(color: Color(0xff888C94), fontSize: 11),
            ),
          ],
        ),
      ],
    );
  }
}
