import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/app_color.dart';

class CustomRowText extends StatelessWidget {
  final String text1;
  final String text2;
  final String iconPath;
  final bool showIcon;

  const CustomRowText({
    super.key,
    required this.text1,
    required this.text2,
    this.iconPath = "",
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              style: TextStyle(
                fontSize: 12.sp,
                letterSpacing: -0.3,
                color: AppColor.primaryColor,
              ),
            ),
            showIcon
                ? Row(
                  children: [
                    Image.network(
                      iconPath,
                      width: 10.w,
                      height: 10.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      text2,
                      style: TextStyle(
                        fontSize: 12.sp,
                        letterSpacing: -0.3,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
                : Text(
                  text2,
                  style: TextStyle(
                    fontSize: 12.sp,
                    letterSpacing: -0.3,
                    color: Colors.white,
                  ),
                ),
          ],
        ),
        Divider(color: Colors.white),
        SizedBox(height: 5.h),
      ],
    );
  }
}
