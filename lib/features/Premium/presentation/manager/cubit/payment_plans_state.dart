part of 'payment_plans_cubit.dart';

sealed class PaymentPlansState extends Equatable {
  const PaymentPlansState();

  @override
  List<Object> get props => [];
}

final class PaymentPlansInitial extends PaymentPlansState {}

final class PaymentPlansLoading extends PaymentPlansState {}

final class PaymentPlansSuccess extends PaymentPlansState {
  final List<PaymentPlanModel> paymentPlansList;

 const PaymentPlansSuccess({required this.paymentPlansList});
}

final class PaymentPlansFailure extends PaymentPlansState {
  final String errMassage;

  const PaymentPlansFailure({required this.errMassage});
}
