
import '../../data/model/weapons_model.dart';

abstract class WeaponState {}

class InitialState extends WeaponState {}

class LoadingState extends WeaponState {}

class SuccessState extends WeaponState {
  final List<WeaponsModel> weapons;

  SuccessState({required this.weapons});
}

class ErrorState extends WeaponState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
