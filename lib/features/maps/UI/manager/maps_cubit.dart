import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/maps_home_repo.dart';
import 'maps_state.dart';

class MapsCubit extends Cubit<MapsState> {
  final MapsHomeRepo mapsHomeRepo;

  MapsCubit({required this.mapsHomeRepo}) : super(InitialState());

  getMaps() async {
    emit(LoadingState());
    var values = await mapsHomeRepo.getMaps();
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (maps) {
        emit(SuccessState(maps: maps));
      },
    );
  }
}
