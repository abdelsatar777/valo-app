
import '../../data/model/gun_buddies_model.dart';

abstract class GunBuddiesState {}

class InitialState extends GunBuddiesState {}

class LoadingState extends GunBuddiesState {}

class SuccessState extends GunBuddiesState {
  final List<GunBuddiesModel> gunBuddies;

  SuccessState({required this.gunBuddies});
}

class ErrorState extends GunBuddiesState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
