import 'package:dartz/dartz.dart';

import '../../../../core/network/api_service.dart';
import '../model/maps_model.dart';
import 'maps_home_repo.dart';

class MapsHomeRepoImpl implements MapsHomeRepo {
  final ApiService apiService;

  MapsHomeRepoImpl({required this.apiService});

  @override
  Future<Either<String, List<MapsModel>>> getMaps() async {
    List<MapsModel> maps = [];
    try {
      var data = await apiService.get(endPoint: "maps");
      for (var i in data['data']) {
        maps.add(MapsModel.fromJson(json: i));
      }
      return Right(maps);
    } catch (error) {
      return Left(error.toString());
    }
  }
}
