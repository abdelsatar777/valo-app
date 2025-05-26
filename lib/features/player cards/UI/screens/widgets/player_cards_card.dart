import 'package:flutter/material.dart';
import '../../../../../core/resources/app_color.dart';
import '../../../data/model/player_cards_model.dart';
import '../set_wallpaper_screen.dart';

class PlayerCardsCard extends StatelessWidget {
  final PlayerCardsModel playerCardsModel;

  const PlayerCardsCard({super.key, required this.playerCardsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    SetWallpaperScreen(imgPath: playerCardsModel.image),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
        ),
        child: Image.network(
          playerCardsModel.image,
          fit: BoxFit.contain,
          // لو الصورة فشلت في التحميل
          errorBuilder: (context, error, stackTrace) {
            return const Placeholder();
          },
        ),
      ),
    );
  }
}
