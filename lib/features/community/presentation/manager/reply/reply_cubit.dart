import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reply_state.dart';

class ReplyCubit extends Cubit<ReplyState> {
  ReplyCubit() : super(ReplyInitial());
}
