import 'package:dartz/dartz.dart';

import '../model/gun_buddies_model.dart';

abstract class GunBuddiesHomeRepo {
  Future<Either<String, List<GunBuddiesModel>>> getGunBuddies();
}
