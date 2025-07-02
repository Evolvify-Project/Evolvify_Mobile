import 'package:evolvify/core/utils/constant.dart';
import 'package:evolvify/features/Premium/data/models/payment_plan_model.dart';
import 'package:evolvify/features/Premium/presentation/views/widgets/Premium_Item.dart';
import 'package:flutter/material.dart';

class PremiumPlan extends StatelessWidget {
  const PremiumPlan({super.key, required this.paymentPlanModel});
  final PaymentPlanModel paymentPlanModel;
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
        color:
            paymentPlanModel.description == "Yearly Premium Plan"
                ? AppColors.kPrimaryColor
                : Color(0xffFFAE6C),
        borderRadius: BorderRadius.circular(15),
      ),

      child: PremiumItem(
        color:
            paymentPlanModel.description == "Yearly Premium Plan"
                ? Colors.white
                : AppColors.kPrimaryColor,
        title: paymentPlanModel.name ?? '',
        subTitle: paymentPlanModel.description ?? '',
        offer: paymentPlanModel.price.toString(),
      ),
    );
  }
}
