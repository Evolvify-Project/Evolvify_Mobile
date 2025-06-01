import 'package:evolvify/core/utils/app_images.dart';
import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';
class CustomSearchCommunity extends StatelessWidget {
  const CustomSearchCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.kPrimaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5, left: 7, right: 5),
        child: ListTile(
          leading: CircleAvatar(
            radius: 17,
            child: Image.asset(Assets.imagesUser),
          ),
          title: Container(
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white,
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 20, left: 10),
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Color(0xff858EAD),
                  fontSize: getResponsiveFontSize(context, fontSize: 12),
                ),
              ),
            ),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Color(0xffFF6934),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 10),
              child: Text(
                'Search',
                style: 
                TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 12),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
