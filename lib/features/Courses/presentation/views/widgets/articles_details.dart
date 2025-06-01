import 'package:cached_network_image/cached_network_image.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/test_button.dart';
import 'package:evolvify/features/Courses/data/models/modules/all_modules/content.dart';
import 'package:evolvify/features/Courses/presentation/manager/Courses-of_module_cubit/modules_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticlesDetails extends StatelessWidget {
  const ArticlesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModulesCubit, ModulesState>(
      builder: (context, state) {
        if (state is ModulesLosding) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ModulesSuccess) {
          final courseOfodules = state.allCoursesModule;
          final List<Content> contentOfCourse = courseOfodules.contents!;
          final courseContent = contentOfCourse[0];

          return Column(
            children: [
              Text(
                courseOfodules.title ?? '',
                style: TextStyle(
                  color: AppColors.kPrimaryColor,

                  fontSize: getResponsiveFontSize(context, fontSize: 21),
                  fontWeight: FontWeight.w600,
                ),
              ),
              ImageOfArticle(imageUrl: courseContent.url ?? ''),

              SizedBox(height: 20),
              Text(
                courseContent.text ?? '',
                style: TextStyle(
                  color: Colors.black,

                  fontSize: getResponsiveFontSize(context, fontSize: 16),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              TestButton(
                text:
                    'Tip: Research the company and prepare specific questions about the role. This shows interest and initiative.',
                onPressed: () {},
                isSelected: true,
              ),
            ],
          );
        } else if (state is ModulesFailure) {
          return Center(child: Text(state.errMessage));
        }
        return Text(' No Courses availble');
      },
    );
  }
}

class ImageOfArticle extends StatelessWidget {
  const ImageOfArticle({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: CachedNetworkImage(
        imageUrl: imageUrl,

        fit: BoxFit.fill,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        placeholder:
            (context, url) => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
