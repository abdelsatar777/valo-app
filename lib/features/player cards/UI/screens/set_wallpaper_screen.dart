import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/features/player%20cards/UI/screens/widgets/set_wallpaper_fun.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_options_data_page.dart';

class SetWallpaperScreen extends StatelessWidget {
  final String imgPath;

  const SetWallpaperScreen({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return CustomOptionsDataPage(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomAppBar(title: "wallpaper"),
            Container(
              height: 500.h,
              width: 250.w,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primaryColor),
              ),
              child: Image.network(
                imgPath,
                fit: BoxFit.cover, // لو الصورة فشلت في التحميل
                errorBuilder: (context, error, stackTrace) {
                  return const Placeholder();
                },
              ),
            ),
            ElevatedButton(
              onPressed: () => SetWallpaperFun.setAsWallpaper(context, imgPath),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                backgroundColor: AppColor.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
              child: Text(
                "set wallpaper",
                style: TextStyle(fontSize: 17.sp, letterSpacing: -0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
