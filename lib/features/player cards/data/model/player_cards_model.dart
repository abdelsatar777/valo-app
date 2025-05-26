class PlayerCardsModel {
  final String image;

  PlayerCardsModel({required this.image});

  factory PlayerCardsModel.fromJson({required Map<String, dynamic> json}) {
    return PlayerCardsModel(image: json['largeArt'] ?? "No Player Cards");
  }
}
