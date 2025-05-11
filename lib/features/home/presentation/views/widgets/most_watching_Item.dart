import 'package:cached_network_image/cached_network_image.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MostWatchingItem extends StatelessWidget {
  const MostWatchingItem({super.key, required this.coursesModel});
  final CoursesModel coursesModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kCourseOverview, extra: coursesModel.id);
      },
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.3 / 1,
              child: CachedNetworkImage(
                imageUrl: coursesModel.imageUrl ?? '',

                fit: BoxFit.fill,
                errorWidget: (context, url, error) => const Icon(Icons.error),
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
              ),
            ),
            // Image.asset(Assets.imagesT),
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
              maxLines: 2,
              style: TextStyle(color: Color(0xffFF001E)),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                // Image.asset(Assets.imagesClock),
                Icon(Icons.access_time, color: Color(0xff888C94), size: 20),
                SizedBox(width: 6),
                Text(
                  coursesModel.duration ?? '',
                  style: TextStyle(
                    color: Color(0xff888C94),
                    fontSize: getResponsiveFontSize(context, fontSize: 11),
                  ),
                ),
                SizedBox(width: 30),
                Text(
                  coursesModel.skill ?? '',
                  style: TextStyle(
                    color: Color(0xff888C94),
                    fontSize: getResponsiveFontSize(context, fontSize: 11),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
