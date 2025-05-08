import 'package:evolvify/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomHeaderHomePage extends StatelessWidget {
  const CustomHeaderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(
        'Hi, Mohamed!',
        style: AppStyle.styleBold22(
          context,
        ).copyWith(fontSize: getResponsiveFontSize(context, fontSize: 25)),
      ),
      subtitle: Text(
        'Ready to grow today?',
        style: AppStyle.styleRegularGrey14(context),
      ),
      trailing: CircleAvatar(
        child: SvgPicture.asset('assets/images/ProfileAvatar.svg'),
      ),
    );
  }
}
