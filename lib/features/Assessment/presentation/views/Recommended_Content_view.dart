import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/core/widgets/cutom_title.dart';
import 'package:evolvify/core/widgets/cutsom_arrow_ios.dart';
import 'package:evolvify/features/Assessment/presentation/views/widgets/recommend_course_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecommendedContentView extends StatelessWidget {
  const RecommendedContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                CutsomArrowios(),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CutomTitle(title: 'Your  Recommended Plan'),
                ),
                SizedBox(height: 20),
                // Add a button to navigate to home screen
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go(AppRouter.kCustomBottomNavigationBar);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Go to Home',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          RecommendCourseList(),
        ],
      ),
    );
  }
}
