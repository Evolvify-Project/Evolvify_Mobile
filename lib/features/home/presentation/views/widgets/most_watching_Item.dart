import 'package:awesome_icons/awesome_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:flutter/material.dart';

class MostWatchingItem extends StatelessWidget {
  const MostWatchingItem({super.key, required this.coursesModel});
  final CoursesModel coursesModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // AspectRatio(
        //   aspectRatio: 1.7 / 1.4,
        //   child: CachedNetworkImage(
        //     imageUrl: '',
        //     // coursesModel.imageUrl ?? '',
        //     fit: BoxFit.fill,
        //     errorWidget: (context, url, error) => const Icon(Icons.error),
        //     placeholder:
        //         (context, url) =>
        //             const Center(child: CircularProgressIndicator()),
        //   ),
        // ),
        Image.asset(Assets.imagesT),
        SizedBox(height: 15),
        Text(
          coursesModel.title ?? '',

          style: TextStyle(
            color: Colors.black,
            fontSize: getResponsiveFontSize(context, fontSize: 15),
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
              style: TextStyle(
                color: Color(0xff888C94),
                fontSize: getResponsiveFontSize(context, fontSize: 11),
              ),
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
              style: TextStyle(
                color: Color(0xff888C94),
                fontSize: getResponsiveFontSize(context, fontSize: 11),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
