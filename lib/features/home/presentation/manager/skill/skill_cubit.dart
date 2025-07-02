import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evolvify/features/home/data/models/skill_model.dart';
import 'package:evolvify/features/home/data/repo/home_repo_impl.dart';

part 'skill_state.dart';

class SkillCubitCubit extends Cubit<SkillState> {
  SkillCubitCubit() : super(SkillInitial());
  Future<void> getSkill() async {
    emit(SkillLosding());

    var skills = await HomeRepoImpl().getSkill();
    skills.fold(
      (failure) {
        emit(SkillFailure(errMessage: failure.errMessge));
      },
      (skilList) {
        emit(SkillSuccess(skillList: skilList));
      },
    );
  }
}
