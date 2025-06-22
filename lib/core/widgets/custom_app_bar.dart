import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_color.dart';
import '../services/is_tablet.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final tablet = IsTablet.isTablet(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: tablet ? 26.r : 18.r,
              color: AppColor.primaryColor,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: tablet ? 20.sp : 16.sp,
            color: Colors.white,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }
}
