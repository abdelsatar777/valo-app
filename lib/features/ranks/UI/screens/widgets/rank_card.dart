import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_color.dart';

class RankCard extends StatelessWidget {
  final String imageUrl;

  const RankCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor),
      ),
      padding: const EdgeInsets.all(8),
      child: Image.network(
        imageUrl,
        fit: BoxFit.contain,
        alignment: Alignment.center,
        // لو الصورة فشلت في التحميل
        errorBuilder: (context, error, stackTrace) {
          return Placeholder(fallbackHeight: 100.h);
        },
      ),
    );
  }
}
