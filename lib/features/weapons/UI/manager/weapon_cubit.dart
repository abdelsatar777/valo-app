import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valo/features/weapons/UI/manager/weapon_state.dart';

import '../../data/repo/weapon_home_repo.dart';

class WeaponCubit extends Cubit<WeaponState> {
  final WeaponHomeRepo weaponHomeRepo;

  WeaponCubit({required this.weaponHomeRepo}) : super(InitialState());

  getWeapons() async {
    emit(LoadingState());
    var values = await weaponHomeRepo.getWeapons();
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (weapons) {
        emit(SuccessState(weapons: weapons));
      },
    );
  }
}
