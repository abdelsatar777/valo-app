import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/agents_home_repo.dart';
import 'agent_details_state.dart';

class AgentDetailsCubit extends Cubit<AgentDetailsState> {
  final AgentsHomeRepo agentsHomeRepo;

  AgentDetailsCubit({required this.agentsHomeRepo}) : super(InitialState());

  getAgentDetails({required String id}) async {
    emit(LoadingState());
    var values = await agentsHomeRepo.getAgentsDetails(id: id);
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (agentDetails) {
        emit(SuccessState(agentDetails: agentDetails));
      },
    );
  }
}
