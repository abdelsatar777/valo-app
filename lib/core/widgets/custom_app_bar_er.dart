import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/core/resources/app_color.dart';

import 'is_tablet.dart';

class CustomAppBarEr extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBarEr({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(56.h); // ارتفاع الأب بار

  @override
  Widget build(BuildContext context) {
    final tablet = IsTablet.isTablet(context);
    return Padding(
      padding: EdgeInsets.only(top: 26.h),
      child: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: tablet ? 26.r : 18.r,
            color: AppColor.primaryColor,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: tablet ? 20.sp : 16.sp,
            color: Colors.white,
            letterSpacing: -0.3,
          ),
        ),
      ),
    );
  }
}
