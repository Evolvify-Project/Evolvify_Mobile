import 'package:bloc/bloc.dart';
import 'package:evolvify/features/auth/data/repo/auth_repo_impl.dart';
import 'package:meta/meta.dart';

part 'verify_pass_state.dart';

class VerifyPassCubit extends Cubit<VerifyPassState> {
  VerifyPassCubit() : super(VerifyPassInitial());

  Future<void> verifyPassWord({required code, required email}) async {
    emit(VerifyPassLoading());
    var result = await AuthRepoImpl().verifyPassWord(code: code, email: email);
    result.fold(
      (failure) {
        emit(VerifyPassFailure(errMessage: failure.errMessge));
      },
      (message) {
        print(code);
        emit(VerifyPassSucess(message));
      },
    );
  }
}
