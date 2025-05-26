class MapsModel {
  final String displayName;
  final String displayIcon;
  final String splash;

  MapsModel({
    required this.displayName,
    required this.displayIcon,
    required this.splash,
  });

  factory MapsModel.fromJson({required Map<String, dynamic> json}) {
    return MapsModel(
      displayName: json['displayName'] ?? "No Name",
      displayIcon: json['displayIcon'] ?? "No Image",
      splash: json['splash'] ?? "No Splash",
    );
  }
}
