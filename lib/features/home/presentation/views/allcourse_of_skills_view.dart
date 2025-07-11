import 'package:evolvify/features/home/presentation/views/widgets/all_courses_gridView.dart';
import 'package:flutter/material.dart';

class AllcourseOfSkillsView extends StatelessWidget {
  const AllcourseOfSkillsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Color(0xff292D32),
              ),

              AllCoursesGridView(),
            ],
          ),
        ),
      ),
    );
  }
}
