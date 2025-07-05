part of 'payment_subscription_cubit.dart';

sealed class PaymentSubscriptionState extends Equatable {
  const PaymentSubscriptionState();

  @override
  List<Object> get props => [];
}

final class PaymentSubscriptionInitial extends PaymentSubscriptionState {}

final class PaymentSubscriptionLoading extends PaymentSubscriptionState {}

final class PaymentSubscriptionSuccessful extends PaymentSubscriptionState {
  final String url;

  const PaymentSubscriptionSuccessful({required this.url});
}

final class PaymentSubscriptionFailure extends PaymentSubscriptionState {
  final String errMassage;

  const PaymentSubscriptionFailure({required this.errMassage});
}
