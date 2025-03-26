import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/community/data/models/UserInfo_model.dart';
import 'package:evolvify/features/community/presentation/views/widgets/User_Info_ListTile.dart';
import 'package:evolvify/features/community/presentation/views/widgets/community_header.dart';
import 'package:evolvify/features/community/presentation/views/widgets/custom_search_community.dart';
import 'package:evolvify/features/community/presentation/views/widgets/post_Item.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 30),
            CommunityHeader(),
            SizedBox(height: 26),
            CustomSearchCommunity(),
            SizedBox(height: 22),
            PostItem(),
          ],
        ),
      ),
    );
  }
}
