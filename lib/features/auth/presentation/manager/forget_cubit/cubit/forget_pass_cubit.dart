import 'package:bloc/bloc.dart';
import 'package:evolvify/features/auth/data/repo/auth_repo_impl.dart';
import 'package:meta/meta.dart';

part 'forget_pass_state.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  ForgetPassCubit() : super(ForgetPassInitial());

  Future<void> forgetPassword(email) async {
    emit(ForgetPassloading());
    var result = await AuthRepoImpl().forgetPassWord(email: email);
    result.fold(
      (failure) {
        emit(ForgetPassfailure(errMassage: failure.errMessge));
      },
      (message) {
        emit(ForgetPasssuccess(message: message));
      },
    );
  }
}
