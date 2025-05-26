import 'package:dartz/dartz.dart';

import '../model/maps_model.dart';

abstract class MapsHomeRepo {
  Future<Either<String, List<MapsModel>>> getMaps();
}
