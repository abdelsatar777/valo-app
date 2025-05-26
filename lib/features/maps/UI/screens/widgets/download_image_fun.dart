import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import 'package:valo/core/resources/app_color.dart';

abstract class DownloadImageFun {
  static Future<void> downloadImage(BuildContext context, String url) async {
    bool permissionGranted = false;
    String date = DateTime.now().toString();
    String fileName = "IMG:$date.jpg";

    // طلب صلاحيات التخزين/الصور حسب نسخة النظام
    if (Platform.isAndroid) {
      if (await Permission.photos.request().isGranted ||
          await Permission.storage.request().isGranted) {
        permissionGranted = true;
      }
    } else if (Platform.isIOS) {
      final PermissionState result =
      await PhotoManager.requestPermissionExtend();
      permissionGranted = result.isAuth;
    } else {
      permissionGranted = true;
    }

    if (!permissionGranted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Permission denied")));
      return;
    }

    try {
      // جلب الصورة من الانترنت
      final response = await Dio().get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      final Uint8List uint8List = Uint8List.fromList(response.data!);

      // حفظ الصورة في معرض الصور
      final AssetEntity? savedAsset = await PhotoManager.editor.saveImage(
        uint8List,
        title: fileName,
      );

      if (savedAsset != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Image saved successfully",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Failed to save image",
              style: TextStyle(fontSize: 20, color: AppColor.primaryColor),
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Download failed: $e")));
    }
  }
}
