import 'package:bloc/bloc.dart';
import 'package:evolvify/features/auth/data/repo/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginCubit() : super(LoginInitial());
  Future login() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var result = await AuthRepoImpl().login(
      email: emailController,
      passWord: passwordController,
    );
    result.fold(
      (failure) {
        emit(Loginfailure(errMassage: failure.errMessge));
      },
      (token) {
        preferences.setString('token', token.token ?? '');
        preferences.setString('email', emailController.text);
        emit(Loginsuccess());
      },
    );
  }

  void validateUser() {
    if (formKey.currentState!.validate()) {
      login();
    }
  }
}
