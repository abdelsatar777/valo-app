
import '../../data/model/sprays_model.dart';

abstract class SpraysState {}

class InitialState extends SpraysState {}

class LoadingState extends SpraysState {}

class SuccessState extends SpraysState {
  final List<SpraysModel> sprays;

  SuccessState({required this.sprays});
}

class ErrorState extends SpraysState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
