
import '../../data/model/agent_details_model.dart';

abstract class AgentDetailsState {}

class InitialState extends AgentDetailsState {}

class LoadingState extends AgentDetailsState {}

class SuccessState extends AgentDetailsState {
  final AgentDetailsModel agentDetails;

  SuccessState({required this.agentDetails});
}

class ErrorState extends AgentDetailsState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
