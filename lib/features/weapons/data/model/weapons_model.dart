class WeaponsModel {
  final String id;
  final String displayName;
  final String displayIcon;

  WeaponsModel({
    required this.id,
    required this.displayName,
    required this.displayIcon,
  });

  factory WeaponsModel.fromJson({required Map<String, dynamic> json}) {
    return WeaponsModel(
      id: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
    );
  }
}
