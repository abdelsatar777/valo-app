import 'package:dartz/dartz.dart';

import '../model/weapons_details_model.dart';
import '../model/weapons_model.dart';

abstract class WeaponHomeRepo {
  Future<Either<String, List<WeaponsModel>>> getWeapons();

  Future<Either<String, WeaponsDetailsModel>> getWeaponDetails({
    required String id,
  });
}
