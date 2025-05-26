class GunBuddiesModel {
  final String displayName;
  final String displayIcon;

  GunBuddiesModel({required this.displayName, required this.displayIcon});

  factory GunBuddiesModel.fromJson({required Map<String, dynamic> json}) {
    return GunBuddiesModel(
      displayName: json['displayName'] ?? "No Name",
      displayIcon: json['displayIcon'] ?? "No Image",
    );
  }
}
