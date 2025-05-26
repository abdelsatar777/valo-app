class RoleModel {
  final String displayName;
  final String displayIcon;

  RoleModel({required this.displayName, required this.displayIcon});

  factory RoleModel.fromJson({required Map<String, dynamic> json}) {
    return RoleModel(
      displayName: json['displayName'] ?? "No Name",
      displayIcon: json['displayIcon'] ?? "No Icon",
    );
  }
}
