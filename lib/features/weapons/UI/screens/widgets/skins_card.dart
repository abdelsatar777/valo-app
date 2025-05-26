import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkinsCard extends StatelessWidget {
  final String imgPath;

  const SkinsCard({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(border: Border.all(color: Colors.redAccent)),
      child: Image.network(
        imgPath,
        width: 270.w,
        fit: BoxFit.contain, // لو الصورة فشلت في التحميل
        errorBuilder: (context, error, stackTrace) {
          return const Placeholder();
        },
      ),
    );
  }
}
