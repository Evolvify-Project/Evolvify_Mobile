import 'package:bloc/bloc.dart';
import 'package:evolvify/features/auth/data/repo/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'reset_state.dart';

class ResetCubit extends Cubit<ResetState> {
  ResetCubit(this.code, this.email) : super(ResetInitial());
  final String code;
  final String email;
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> resetPassWord() async {
    emit(ResetLoading());
    var result = await AuthRepoImpl().resetPassWord(
      code: code,
      email: email,
      passWord: passwordController.text,
      confirmPassword: passwordConfirmController.text,
    );
    result.fold(
      (failure) {
        emit(ResetFailure(errMessage: failure.errMessge));
      },
      (message) {
        emit(ResetSuccess());
      },
    );
  }

  void validateUser() {
    if (formKey.currentState!.validate()) {
      resetPassWord();
    }
  }
}
