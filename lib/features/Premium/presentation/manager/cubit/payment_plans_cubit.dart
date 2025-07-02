import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Premium/data/repo/payment_repo_impl.dart';

part 'payment_plans_state.dart';

class PaymentPlansCubit extends Cubit<PaymentPlansState> {
  PaymentPlansCubit() : super(PaymentPlansInitial());

  Future<void> getPaymentPlans() async {
    emit(PaymentPlansLoading());
    var paymentPlans = await PaymentRepoImpl().getPaymentPlans();
    paymentPlans.fold(
      (failure) {
        emit(PaymentPlansFailure(errMassage: failure.errMessge));
      },
      (paymentPlansList) {
        emit(PaymentPlansSuccess(paymentPlansList: paymentPlansList));
      },
    );
  }


}
