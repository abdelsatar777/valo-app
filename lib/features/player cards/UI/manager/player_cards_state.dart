
import '../../data/model/player_cards_model.dart';

abstract class PlayerCardsState {}

class InitialState extends PlayerCardsState {}

class LoadingState extends PlayerCardsState {}

class SuccessState extends PlayerCardsState {
  final List<PlayerCardsModel> playerCardsModel;

  SuccessState({required this.playerCardsModel});
}

class ErrorState extends PlayerCardsState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
