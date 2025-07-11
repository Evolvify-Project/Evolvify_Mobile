import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/features/community/data/models/UserInfo_model.dart';
import 'package:evolvify/features/community/data/models/post.dart';
import 'package:evolvify/features/community/presentation/views/widgets/User_Info_ListTile.dart';
import 'package:evolvify/features/community/presentation/views/widgets/comment_on_post.dart';
import 'package:evolvify/features/community/presentation/views/widgets/like_on_post.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.postModel});
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xffA8A8A8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfoListTile(
            userinfoModel: UserinfoModel(
              title: postModel.username ?? 'Amira',
              subtitle: postModel.createdAt ?? '',
              image:  Assets.imagesProfileImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 17, right: 35),
            child: Text(
              textAlign: TextAlign.start,
              postModel.content ?? '',
              style: TextStyle(
                fontSize: getResponsiveFontSize(context, fontSize: 12),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Divider(height: 30, color: Color(0xffC4C4C4)),
          Padding(
            padding: const EdgeInsets.only(
              left: 17,
              top: 5,
              bottom: 15,
              right: 36,
            ),
            child: Row(
              children: [
                CustomLikeOnPost(postModel: postModel),
                CommentOnPost(postModel: postModel),
                Expanded(child: SizedBox()),
                Image.asset(Assets.imagesShare),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
