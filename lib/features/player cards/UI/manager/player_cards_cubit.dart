import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valo/features/player%20cards/UI/manager/player_cards_state.dart';

import '../../data/repo/player_cards_home_repo.dart';

class PlayerCardsCubit extends Cubit<PlayerCardsState> {
  final PlayerCardsHomeRepo playerCardsHomeRepo;

  PlayerCardsCubit({required this.playerCardsHomeRepo}) : super(InitialState());

  getPlayerCards() async {
    emit(LoadingState());
    var values = await playerCardsHomeRepo.getPlayerCards();
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (playerCards) {
        emit(SuccessState(playerCardsModel: playerCards));
      },
    );
  }
}
