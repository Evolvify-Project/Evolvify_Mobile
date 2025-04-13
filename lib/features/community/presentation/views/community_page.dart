import 'package:evolvify/features/community/presentation/views/widgets/community_header.dart';
import 'package:evolvify/features/community/presentation/views/widgets/custom_search_community.dart';
import 'package:evolvify/features/community/presentation/views/widgets/posts_List.dart';
import 'package:flutter/material.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              CommunityHeader(),
              SizedBox(height: 26),
              CustomSearchCommunity(),

              PostsList(),
            ],
          ),
        ),
      ),
    );
  }
}
