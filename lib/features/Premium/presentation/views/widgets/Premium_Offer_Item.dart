import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:flutter/material.dart';

class PremiumOfferItem extends StatelessWidget {
  const PremiumOfferItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.offer, required this.color,
  });
  final String title, subTitle, offer;
  @override
 final Color color;
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: color,
          fontSize: getResponsiveFontSize(context, fontSize: 20),
        ),
      ),

      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: color,
            fontSize: getResponsiveFontSize(context, fontSize: 14),
          ),
        ),
      ),
      trailing: Text(
        offer,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: color,
          fontSize: getResponsiveFontSize(context, fontSize: 20),
        ),
      ),
    );
  }
}
