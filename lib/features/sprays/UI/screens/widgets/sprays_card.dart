import 'package:flutter/material.dart';
import '../../../../../core/resources/app_color.dart';
import '../../../data/model/sprays_model.dart';

class SpraysCard extends StatelessWidget {
  final SpraysModel spraysModel;

  const SpraysCard({super.key, required this.spraysModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor),
      ),
      child: Image.network(
        spraysModel.displayIcon,
        // fit: BoxFit.contain,
        // لو الصورة فشلت في التحميل
        errorBuilder: (context, error, stackTrace) {
          return const Placeholder();
        },
      ),
    );
  }
}
