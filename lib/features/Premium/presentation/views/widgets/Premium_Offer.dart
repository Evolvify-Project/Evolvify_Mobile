import 'package:evolvify/core/utils/app_style.dart';
import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/Premium/presentation/views/widgets/Premium_Offer_Item.dart';
import 'package:flutter/material.dart';

class PremiumOffer extends StatelessWidget {
  const PremiumOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 3),
              ),
            ],
            color: Color(0xffFFAE6C),
            borderRadius: BorderRadius.circular(15),
          ),

          child: PremiumOfferItem(
            color:AppColors.kPrimaryColor,
            title: 'Unlimited plan',
            subTitle: 'One time purchase',
            offer: '120.00',
          ),
        ),
        Positioned(
          left: 8,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Color(0xffFFA927)),
            ),
            child: Text(
              'Best Offer',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xffFFA927),
                fontSize: getResponsiveFontSize(context, fontSize: 13),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
