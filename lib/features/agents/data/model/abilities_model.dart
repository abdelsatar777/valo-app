class AbilitiesModel {
  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  AbilitiesModel({
    required this.slot,
    required this.displayName,
    required this.description,
    required this.displayIcon,
  });

  factory AbilitiesModel.fromJson({required Map<String, dynamic> json}) {
    return AbilitiesModel(
      slot: json['slot'] ?? "No Slot",
      displayName: json['displayName'] ?? "No Name",
      description: json['description'] ?? "No Description",
      displayIcon: json['displayIcon'] ?? "No Icon",
    );
  }
}
