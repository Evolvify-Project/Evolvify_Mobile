import 'package:bloc/bloc.dart';
import 'package:evolvify/features/auth/data/repo/auth_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  RegisterCubit() : super(RegisterInitial());

  Future registerUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isLoading = true;
    emit(Registerloading());

    var registerResult = await AuthRepoImpl().register(
      userName: userNameController.text,
      email: emailController.text,
      confirmPassword: confirmPasswordController.text,
      passWord: passwordController.text,
    );

    registerResult.fold(
      (failure) {
        print(' ${failure.errMessge}');
        emit(Registerfailure(errMassage: failure.errMessge));
      },
      (token) {
        isLoading = false;
        if (token.token != null) {
          preferences.setString('token', token.token!);
        }

        emit(Registersuccess());
      },
    );
  }

  void vaildateRegister() {
    if (formKey.currentState!.validate()) {
      registerUser();
    }
  }
}

// teest12@example.com
// PassWord@123
