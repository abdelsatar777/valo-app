import 'package:dartz/dartz.dart';
import 'package:valo/features/player%20cards/data/repo/player_cards_home_repo.dart';

import '../../../../core/network/api_service.dart';
import '../model/player_cards_model.dart';

class PlayerCardsHomeRepoImpl implements PlayerCardsHomeRepo {
  final ApiService apiService;

  PlayerCardsHomeRepoImpl({required this.apiService});

  @override
  Future<Either<String, List<PlayerCardsModel>>> getPlayerCards() async {
    List<PlayerCardsModel> playerCards = [];
    try {
      var data = await apiService.get(endPoint: "playercards");
      for (var i in data['data']) {
        playerCards.add(PlayerCardsModel.fromJson(json: i));
      }
      return Right(playerCards);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
