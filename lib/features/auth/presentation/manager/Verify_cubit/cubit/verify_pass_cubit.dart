import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'verify_pass_state.dart';

class VerifyPassCubit extends Cubit<VerifyPassState> {
  VerifyPassCubit() : super(VerifyPassInitial());
}
