import 'package:evolvify/features/Premium/presentation/manager/cubit/payment_plans_cubit.dart';
import 'package:evolvify/features/Premium/presentation/views/widgets/Premium_plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlansList extends StatelessWidget {
  const PlansList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentPlansCubit, PaymentPlansState>(
      builder: (context, state) {
        if (state is PaymentPlansLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PaymentPlansSuccess) {
          final paymentPlanList = state.paymentPlansList;
          return ListView.builder(
            shrinkWrap: true,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount: paymentPlanList.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: PremiumPlan(paymentPlanModel: paymentPlanList[index]),
              );
            },
          );
        } else if (state is PaymentPlansFailure) {
          return Text(state.errMassage);
        }
        return Center(child: Text('No Plans available.'));
      },
    );
  }
}
