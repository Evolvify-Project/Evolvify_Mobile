import 'package:cached_network_image/cached_network_image.dart';
import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/features/Assessment/data/models/courses_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.coursesModel});
  final CoursesModel coursesModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(
          context,
        ).push(AppRouter.kCourseOverview, extra: coursesModel.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 4,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: AspectRatio(
          aspectRatio: 1.3 / 1.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: AspectRatio(
                  aspectRatio: 1.3 / 1,
                  child: CachedNetworkImage(
                    imageUrl: coursesModel.imageUrl ?? '',
                    fit: BoxFit.cover,
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                    placeholder:
                        (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),

              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        Icon(
                          Icons.access_time,
                          color: Color(0xff888C94),
                          size: 20,
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            coursesModel.duration ?? '',
                            style: TextStyle(
                              color: Color(0xff888C94),
                              fontSize: getResponsiveFontSize(
                                context,
                                fontSize: 11,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            coursesModel.skill ?? '',
                            style: TextStyle(
                              color: Color(0xff888C94),
                              fontSize: getResponsiveFontSize(
                                context,
                                fontSize: 11,
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
