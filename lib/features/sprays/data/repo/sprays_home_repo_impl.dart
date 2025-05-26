import 'package:dartz/dartz.dart';
import 'package:valo/features/sprays/data/repo/sprays_home_repo.dart';

import '../../../../core/network/api_service.dart';
import '../model/sprays_model.dart';

class SpraysHomeRepoImpl implements SpraysHomeRepo {
  final ApiService apiService;

  SpraysHomeRepoImpl({required this.apiService});

  @override
  Future<Either<String, List<SpraysModel>>> getSprays() async {
    List<SpraysModel> sprays = [];
    try {
      var data = await apiService.get(endPoint: "sprays");
      for (var i in data['data']) {
        sprays.add(SpraysModel.fromJson(json: i));
      }
      return Right(sprays);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
