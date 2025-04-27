part of 'forget_pass_cubit.dart';

@immutable
sealed class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class ForgetPassloading extends ForgetPassState {}

final class ForgetPasssuccess extends ForgetPassState {
  final message;

  ForgetPasssuccess({required this.message});
}

final class ForgetPassfailure extends ForgetPassState {
  final String errMassage;

  ForgetPassfailure({required this.errMassage});
}
