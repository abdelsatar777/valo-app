class SkinsModel {
  final String displayIcon;

  SkinsModel({required this.displayIcon});

  factory SkinsModel.fromJson({required Map<String, dynamic> json}) {
    return SkinsModel(displayIcon: json['displayIcon'] ?? "No url");
  }
}
