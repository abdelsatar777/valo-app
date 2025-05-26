import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:external_path/external_path.dart';
import 'package:path/path.dart' as p;
import 'package:valo/core/resources/app_color.dart';

abstract class SetWallpaperFun {
  static Future<void> setAsWallpaper(BuildContext context, String url) async {
    final status = await Permission.storage.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Permission denied")));
      return;
    }

    try {
      // تخزين الصورة في مجلد Downloads
      final picturesDir = await ExternalPath.getExternalStoragePublicDirectory(
        "Pictures",
      );
      final filePath = p.join(
        picturesDir,
        'wallpaper_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      await Dio().download(url, filePath);

      await Future.delayed(const Duration(seconds: 1)); // مهلة بسيطة قبل التعين

      // افتح دايلوج الاختيار
      final wallpaperLocation = await showDialog<int>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColor.backgroundColor,
            title: Text(
              'Set the Wallpaper',
              style: TextStyle(fontSize: 14.sp, color: AppColor.primaryColor),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Text(
                    'Set as Lock screen',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  onTap:
                      () => Navigator.pop(context, AsyncWallpaper.LOCK_SCREEN),
                ),
                ListTile(
                  title: Text(
                    'Set as Home screen',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  onTap:
                      () => Navigator.pop(context, AsyncWallpaper.HOME_SCREEN),
                ),
                ListTile(
                  title: Text('Set as both', style: TextStyle(fontSize: 12.sp)),
                  onTap:
                      () => Navigator.pop(context, AsyncWallpaper.BOTH_SCREENS),
                ),
              ],
            ),
          );
        },
      );

      if (wallpaperLocation == null) {
        return;
      }

      bool result = await AsyncWallpaper.setWallpaperFromFile(
        filePath: filePath,
        wallpaperLocation: wallpaperLocation,
        goToHome: false,
      );

      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Background set successfully"),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColor.primaryColor,
            content: Text("Failed to set background"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Assignment failed: $e")));
    }
  }
}
