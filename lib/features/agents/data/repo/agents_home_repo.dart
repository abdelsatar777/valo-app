import 'package:dartz/dartz.dart';

import '../model/agent_details_model.dart';
import '../model/agents_model.dart';

abstract class AgentsHomeRepo {
  Future<Either<String, List<AgentsModel>>> getAgents();

  Future<Either<String, AgentDetailsModel>> getAgentsDetails({required String id});
}
