import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valo/features/weapons/UI/manager/weapon_details_state.dart';

import '../../data/repo/weapon_home_repo.dart';

class WeaponDetailsCubit extends Cubit<WeaponDetailsState> {
  final WeaponHomeRepo weaponHomeRepo;

  WeaponDetailsCubit({required this.weaponHomeRepo}) : super(InitialState());

  getWeaponDetails({required String id}) async {
    emit(LoadingState());
    var values = await weaponHomeRepo.getWeaponDetails(id: id);
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (weaponsDetails) {
        emit(SuccessState(weaponsDetailsModel: weaponsDetails));
      },
    );
  }
}
