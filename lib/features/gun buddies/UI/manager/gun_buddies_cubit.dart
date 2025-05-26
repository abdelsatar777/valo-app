import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/gun_buddies_home_repo.dart';
import 'gun_buddies_state.dart';

class GunBuddiesCubit extends Cubit<GunBuddiesState> {
  final GunBuddiesHomeRepo gunBuddiesHomeRepo;

  GunBuddiesCubit({required this.gunBuddiesHomeRepo}) : super(InitialState());

  getGunBuddies() async {
    emit(LoadingState());
    var values = await gunBuddiesHomeRepo.getGunBuddies();
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (gunBuddies) {
        emit(SuccessState(gunBuddies: gunBuddies));
      },
    );
  }
}
