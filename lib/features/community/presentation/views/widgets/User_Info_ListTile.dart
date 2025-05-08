import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/features/community/data/models/UserInfo_model.dart';
import 'package:flutter/material.dart';

class UserInfoListTile extends StatelessWidget {
  const UserInfoListTile({super.key, required this.userinfoModel});
  final UserinfoModel userinfoModel;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Image.asset(userinfoModel.image)),
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          userinfoModel.title,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 14),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      subtitle: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          userinfoModel.subtitle,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 9),
            fontWeight: FontWeight.w400,
            color: Color(0xffA1A1A1),
          ),
        ),
      ),
    );
  }
}
