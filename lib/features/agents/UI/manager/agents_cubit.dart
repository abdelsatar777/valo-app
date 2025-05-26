import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/agents_home_repo.dart';
import 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  final AgentsHomeRepo agentsHomeRepo;

  AgentsCubit({required this.agentsHomeRepo}) : super(InitialState());

  getAgents() async {
    emit(LoadingState());
    var values = await agentsHomeRepo.getAgents();
    values.fold(
      (error) {
        emit(ErrorState(errorMsg: error));
      },
      (agents) {
        emit(SuccessState(agents: agents));
      },
    );
  }
}
