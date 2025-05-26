
import 'package:valo/features/weapons/data/model/skins_model.dart';
import 'package:valo/features/weapons/data/model/weapon_stats_model.dart';

class WeaponsDetailsModel {
  final String displayName;
  final String displayIcon;
  final WeaponStatsModel weaponStatsModel;
  final List<SkinsModel> skinsModel;

  WeaponsDetailsModel({
    required this.displayName,
    required this.displayIcon,
    required this.weaponStatsModel,
    required this.skinsModel,
  });

  factory WeaponsDetailsModel.fromJson({required Map<String, dynamic> json}) {
    return WeaponsDetailsModel(
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
      weaponStatsModel:
          json['weaponStats'] != null
              ? WeaponStatsModel.fromJson(json: json['weaponStats'])
              : WeaponStatsModel.empty(),
      skinsModel:
          (json['skins'] as List<dynamic>)
              .map((x) => SkinsModel.fromJson(json: x))
              .toList(),
    );
  }
}
