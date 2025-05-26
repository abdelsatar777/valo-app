
import '../../data/model/weapons_details_model.dart';

abstract class WeaponDetailsState {}

class InitialState extends WeaponDetailsState {}

class LoadingState extends WeaponDetailsState {}

class SuccessState extends WeaponDetailsState {
  final WeaponsDetailsModel weaponsDetailsModel;

  SuccessState({required this.weaponsDetailsModel});
}

class ErrorState extends WeaponDetailsState {
  final String errorMsg;

  ErrorState({required this.errorMsg});
}
