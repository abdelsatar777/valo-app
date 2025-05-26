import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_color.dart';
import '../../../data/model/maps_model.dart';
import 'download_image_fun.dart';

class MapCard extends StatelessWidget {
  final MapsModel mapsModel;

  const MapCard({super.key, required this.mapsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                backgroundColor: AppColor.backgroundColor,
                contentPadding: const EdgeInsets.all(16),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        mapsModel.splash,
                        height: 200.h,
                        fit: BoxFit.cover,
                        // لو الصورة فشلت في التحميل
                        errorBuilder: (context, error, stackTrace) {
                          return const Placeholder();
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: () {
                        DownloadImageFun.downloadImage(
                          context,
                          mapsModel.splash,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                      child: Text(
                        "Download",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
              ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor),
            ),
            child: Image.network(
              mapsModel.displayIcon,
              fit: BoxFit.contain,
              // لو الصورة فشلت في التحميل
              errorBuilder: (context, error, stackTrace) {
                return Placeholder(fallbackHeight: 170.h);
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 12.w),
            color: AppColor.primaryColor,
            child: Text(
              mapsModel.displayName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13.sp,
                letterSpacing: -0.3,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
