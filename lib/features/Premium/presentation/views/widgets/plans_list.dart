import 'package:evolvify/core/widgets/showSnackBar.dart';
import 'package:evolvify/features/Premium/data/models/payment_plan_model.dart';
import 'package:evolvify/features/Premium/presentation/manager/cubit/payment_plans_cubit.dart';
import 'package:evolvify/features/Premium/presentation/manager/cubit/payment_subscription_cubit.dart';
import 'package:evolvify/features/Premium/presentation/views/widgets/Premium_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

class PlansList extends StatelessWidget {
  const PlansList({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentSubscriptionCubit, PaymentSubscriptionState>(
      listener: (context, state) async {
        if (state is PaymentSubscriptionSuccessful) {
          final url = state.url;
          if (await canLaunchUrl(Uri.parse(url))) {
            await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView);
          } else {
            showSnackBar(context, text: "لا يمكن فتح رابط الدفع");
          }
        } else if (state is PaymentSubscriptionFailure) {
          showSnackBar(context, text: "فشل في الدفع: ${state.errMassage}");
        }
      },
      child: BlocBuilder<PaymentPlansCubit, PaymentPlansState>(
        builder: (context, state) {
          if (state is PaymentPlansLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PaymentPlansSuccess) {
            final List<PaymentPlanModel> paymentPlanList =
                state.paymentPlansList;
            return ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: paymentPlanList.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: PremiumPlan(
                    paymentPlanModel: paymentPlanList[index],
                    onTap: () {
                      final priceId =
                          paymentPlanList[index].stripePriceId.toString();

                      final cubit = context.read<PaymentSubscriptionCubit>();
                      cubit.createSubscription(priceId);
                      print("priceId to send: $priceId");
                      print("🔵 Cubit instance: $cubit");
                    },
                  ),
                );
              },
            );
          } else if (state is PaymentPlansFailure) {
            return Text(state.errMassage);
          }
          return Center(child: Text('No Plans available.'));
        },
      ),
    );
  }
}
