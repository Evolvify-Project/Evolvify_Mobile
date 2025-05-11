import 'package:evolvify/core/utils/app_router.dart';
import 'package:evolvify/features/home/presentation/views/widgets/Ccustom_header_homePage.dart';
import 'package:evolvify/core/widgets/customSearch.dart';
import 'package:evolvify/features/home/presentation/views/widgets/custom_row.dart';
import 'package:evolvify/features/home/presentation/views/widgets/most_skills_listView.dart';
import 'package:evolvify/features/home/presentation/views/widgets/popular_skill_gridView.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  CustomHeaderHomePage(),
                  SizedBox(height: 10),

                  CustOmSearch(
                    onTap:
                       
                        () {
                          GoRouter.of(context).push(AppRouter.kSearchView);
                        },
                  ),

                  SizedBox(height: 10),
                  CustomRowText(text1: 'Most watching Skill'),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 24, left: 4),
              child: MostSkillsListView(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  CustomRowText(text1: 'Popular Skill'),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: PopularSkillgridView(),
          ),
        ],
      ),
    );
  }
}
