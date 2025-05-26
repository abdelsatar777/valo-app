import 'package:dartz/dartz.dart';

import '../model/player_cards_model.dart';

abstract class PlayerCardsHomeRepo {
  Future<Either<String, List<PlayerCardsModel>>> getPlayerCards();
}
