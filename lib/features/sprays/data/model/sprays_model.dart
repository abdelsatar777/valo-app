class SpraysModel {
  final String displayIcon;

  SpraysModel({required this.displayIcon});

  factory SpraysModel.fromJson({required Map<String, dynamic> json}) {
    return SpraysModel(displayIcon: json['displayIcon'] ?? "No Sprays");
  }
}
