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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 40)),
            SliverToBoxAdapter(child: CustomHeaderHomePage()),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: CustOmSearch(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kSearchView);
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: CustomRowText(text1: 'Most watching Skill'),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: MostSkillsListView()),
            SliverToBoxAdapter(child: SizedBox(height: 20)),
            SliverToBoxAdapter(child: CustomRowText(text1: 'Popular Skill')),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            PopularSkillgridView(),
          ],
        ),
      ),
    );
  }
}
