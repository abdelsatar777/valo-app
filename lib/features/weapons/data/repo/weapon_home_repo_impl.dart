import 'package:dartz/dartz.dart';
import 'package:valo/features/weapons/data/repo/weapon_home_repo.dart';

import '../../../../core/network/api_service.dart';
import '../model/weapons_details_model.dart';
import '../model/weapons_model.dart';

class WeaponHomeRepoImpl implements WeaponHomeRepo {
  final ApiService apiService;

  WeaponHomeRepoImpl({required this.apiService});

  @override
  Future<Either<String, List<WeaponsModel>>> getWeapons() async {
    List<WeaponsModel> weapons = [];
    try {
      var data = await apiService.get(endPoint: "weapons");
      for (var i in data['data']) {
        weapons.add(WeaponsModel.fromJson(json: i));
      }
      return Right(weapons);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, WeaponsDetailsModel>> getWeaponDetails({
    required String id,
  }) async {
    try {
      var data = await apiService.get(endPoint: "weapons/$id");
      return Right(WeaponsDetailsModel.fromJson(json: data['data']));
    } catch (error) {
      return Left(error.toString());
    }
  }
}
