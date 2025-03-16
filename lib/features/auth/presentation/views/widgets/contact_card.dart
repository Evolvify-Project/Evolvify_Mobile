import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,

    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String title, subTitle, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        border: Border.all(width: 3, color: AppColors.kPrimaryColor),
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 6, bottom: 15),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(left: 15, top: 7),
            child: SvgPicture.asset(image),
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                title,
                style: AppStyle.styleNexa15.copyWith(fontSize: 14),
              ),
            ),
          ),
          subtitle: Center(
            child: Text(
              subTitle,
              style: AppStyle.styleNexa15.copyWith(
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
