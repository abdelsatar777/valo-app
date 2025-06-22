import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/core/resources/app_assets.dart';
import 'package:valo/core/widgets/custom_app_bar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.aboutWallpaperImg, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              color: const Color(0xCC1F2326), // شفافية حوالي 80% (CC)
            ),
          ),
          Positioned(
            right: -1,
            child: Image.asset(AppAssets.valorantImg, fit: BoxFit.cover),
          ),
          Positioned(
            top: 30,
            right: 0,
            left: 0,
            child: CustomAppBar(title: "About App"),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "VALO APP",
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Version 1.1",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.h),
                Image.asset(AppAssets.logoImg),
                SizedBox(height: 20.h),
                Text(
                  "Made by",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Abdelsatar | 3BS",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
