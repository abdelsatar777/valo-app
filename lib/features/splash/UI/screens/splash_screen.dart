import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/services/is_tablet.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a timer that will expire after 3 seconds.
    Timer(Duration(seconds: 5), () {
      // Redirect to next page after counter ends
      Navigator.pushReplacementNamed(context, "/home_screen");
    });
  }

  @override
  Widget build(BuildContext context) {
    final tablet = IsTablet.isTablet(context);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "loading",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Venite',
                fontSize: tablet ? 45.sp : 26.sp,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 18.h),
            CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: tablet ? 3.5 : 3,
            ),
          ],
        ),
      ),
    );
  }
}
