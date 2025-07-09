import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/community/data/models/comment_model.dart';

import 'package:flutter/material.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    super.key,
    this.onTapReply,
    required this.commentModel,
  });
  final void Function()? onTapReply;
  final CommentModel2 commentModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(backgroundImage: AssetImage(Assets.imagesUser)),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                commentModel.userName ?? 'Ali',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 12),
                  fontWeight: FontWeight.w600,
                  color: AppColors.kPrimaryColor,
                ),
              ),
              SizedBox(height: 8),
              Text(
                maxLines: 3,
                commentModel.content ?? '',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 12),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
            
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Like .',
                      style: TextStyle(
                        color: Color(0xff4267B2),
                        fontSize: getResponsiveFontSize(context, fontSize: 12),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: onTapReply,
                    child: Text(
                      'Reply .',
                      style: TextStyle(
                        color: Color(0xff4267B2),
                        fontSize: getResponsiveFontSize(context, fontSize: 12),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '6h',
                    style: TextStyle(
                      color: Color(0xff90949C),
                      fontSize: getResponsiveFontSize(context, fontSize: 12),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
