import 'package:dartz/dartz.dart';
import '../../../../core/network/api_service.dart';
import '../model/agent_details_model.dart';
import '../model/agents_model.dart';
import 'agents_home_repo.dart';

class AgentsHomeRepoImpl implements AgentsHomeRepo {
  final ApiService apiService;

  AgentsHomeRepoImpl({required this.apiService});

  @override
  Future<Either<String, List<AgentsModel>>> getAgents() async {
    List<AgentsModel> agents = [];
    try {
      var data = await apiService.get(endPoint: "agents");
      for (var i in data['data']) {
        agents.add(AgentsModel.fromJson(json: i));
      }
      return Right(agents);
    } catch (error) {
      return Left(error.toString());
    }
  }

  @override
  Future<Either<String, AgentDetailsModel>> getAgentsDetails({
    required String id,
  }) async {
    try {
      var data = await apiService.get(endPoint: "agents/$id");
      return Right(AgentDetailsModel.fromJson(json: data['data']));
    } catch (error) {
      return Left(error.toString());
    }
  }
}
