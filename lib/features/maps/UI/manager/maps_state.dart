
import '../../data/model/maps_model.dart';

abstract class MapsState {}

class InitialState extends MapsState {}

class LoadingState extends MapsState {}

class SuccessState extends MapsState {
  final List<MapsModel> maps;

  SuccessState({required this.maps});
}

class ErrorState extends MapsState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
