
import '../../data/model/agents_model.dart';

abstract class AgentsState {}

class InitialState extends AgentsState {}

class LoadingState extends AgentsState {}

class SuccessState extends AgentsState {
  final List<AgentsModel> agents;

  SuccessState({required this.agents});
}

class ErrorState extends AgentsState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
