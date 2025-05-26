import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_color.dart';
import '../../../data/model/gun_buddies_model.dart';

class GunBuddiesCard extends StatelessWidget {
  final GunBuddiesModel gunBuddiesModel;

  const GunBuddiesCard({super.key, required this.gunBuddiesModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor),
          ),
          child: Image.network(
            gunBuddiesModel.displayIcon,
            fit: BoxFit.contain,
            // لو الصورة فشلت في التحميل
            errorBuilder: (context, error, stackTrace) {
              return const Placeholder();
            },
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: AppColor.primaryColor,
          child: Text(
            gunBuddiesModel.displayName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              letterSpacing: -0.3,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
