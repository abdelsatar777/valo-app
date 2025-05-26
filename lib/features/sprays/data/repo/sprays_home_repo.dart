import 'package:dartz/dartz.dart';

import '../model/sprays_model.dart';

abstract class SpraysHomeRepo {
  Future<Either<String, List<SpraysModel>>> getSprays();
}
