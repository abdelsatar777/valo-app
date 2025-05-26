import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_color.dart';
import '../../../data/model/weapons_model.dart';
import '../weapons_details_screen.dart';

class WeaponsCard extends StatelessWidget {
  final WeaponsModel weaponsModel;

  const WeaponsCard({super.key, required this.weaponsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WeaponsDetailsScreen(id: weaponsModel.id),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColor.cardOptionColor,
          border: Border.all(color: AppColor.primaryColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              weaponsModel.displayIcon,
              height: 100.h,
              fit: BoxFit.contain,
              // لو الصورة فشلت في التحميل
              errorBuilder: (context, error, stackTrace) {
                return const Placeholder();
              },
            ),
            Text(
              weaponsModel.displayName,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
