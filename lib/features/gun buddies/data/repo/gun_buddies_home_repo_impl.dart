import 'package:dartz/dartz.dart';

import '../../../../core/network/api_service.dart';
import '../model/gun_buddies_model.dart';
import 'gun_buddies_home_repo.dart';

class GunBuddiesHomeRepoImpl implements GunBuddiesHomeRepo {
  final ApiService apiService;

  GunBuddiesHomeRepoImpl({required this.apiService});

  @override
  Future<Either<String, List<GunBuddiesModel>>> getGunBuddies() async {
    List<GunBuddiesModel> gunBuddies = [];
    try {
      var data = await apiService.get(endPoint: "buddies");
      for (var i in data['data']) {
        gunBuddies.add(GunBuddiesModel.fromJson(json: i));
      }
      return Right(gunBuddies);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
