class WeaponStatsModel {
  final String magazineSize;
  final String wallPenetration;
  final String fireMode;
  final String fireRate;
  final List<Map<String, dynamic>> damageRanges;

  WeaponStatsModel({
    required this.magazineSize,
    required this.wallPenetration,
    required this.fireMode,
    required this.fireRate,
    required this.damageRanges,
  });

  factory WeaponStatsModel.fromJson({required Map<String, dynamic> json}) {
    return WeaponStatsModel(
      magazineSize: json['magazineSize'].toString(),
      wallPenetration: json['wallPenetration'] ?? "No Wall Penetration",
      fireMode: json['fireMode'] ?? "No Fire Mode",
      fireRate: json['fireRate'].toString(),
      damageRanges:
          (json['damageRanges'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          [],
    );
  }

  factory WeaponStatsModel.empty() {
    return WeaponStatsModel(
      magazineSize: "No Magazine Size",
      wallPenetration: "No Wall Penetration",
      fireMode: "No Fire Mode",
      fireRate: "No Fire Rate",
      damageRanges: [],
    );
  }

}
