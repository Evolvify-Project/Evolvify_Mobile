import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/Premium/data/repo/payment_repo_impl.dart';

part 'payment_subscription_state.dart';

class PaymentSubscriptionCubit extends Cubit<PaymentSubscriptionState> {
  PaymentSubscriptionCubit() : super(PaymentSubscriptionInitial());
  Future<void> createSubscription(String stripePriceId) async {
    // print("🟡 Cubit createSubscription called with: $stripePriceId");
    var result = await PaymentRepoImpl().createSubscription(stripePriceId);
    result.fold(
      (failure) {
        return emit(PaymentSubscriptionFailure(errMassage: failure.errMessge));
      },
      (url) {
        emit(PaymentSubscriptionSuccessful(url: url));
      },
    );
  }
}
