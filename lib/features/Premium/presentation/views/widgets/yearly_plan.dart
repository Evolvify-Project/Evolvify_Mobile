import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/Premium/presentation/views/widgets/Premium_Offer_Item.dart';
import 'package:flutter/material.dart';

class YearlyPlan extends StatelessWidget {
  const YearlyPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 3),
          ),
        ],
        color: AppColors.kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),

      child: PremiumOfferItem(
        color: Colors.white,
        title: 'Yearly plan',
        subTitle: r'$75 dollar billed every year',
        offer: '5.99/mo',
      ),
    );
  }
}
