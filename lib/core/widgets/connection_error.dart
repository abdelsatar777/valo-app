import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resources/app_assets.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.noWifiImg, height: 130.h),
            SizedBox(height: 16.h),
            Text(
              "Check your internet connection",
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(fontSize: 20.sp, letterSpacing: -0.3),
            ),
          ],
        ),
      ),
    );
  }
}
