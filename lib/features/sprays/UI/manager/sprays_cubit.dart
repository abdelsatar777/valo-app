import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valo/features/sprays/UI/manager/sprays_state.dart';

import '../../data/repo/sprays_home_repo.dart';

class SpraysCubit extends Cubit<SpraysState> {
  final SpraysHomeRepo spraysHomeRepo;

  SpraysCubit({required this.spraysHomeRepo}) : super(InitialState());

  getSprays() async {
    emit(LoadingState());
    var values = await spraysHomeRepo.getSprays();
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (sprays) {
        emit(SuccessState(sprays: sprays));
      },
    );
  }
}
