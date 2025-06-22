import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_color.dart';
import '../../../../../core/services/is_tablet.dart';
import '../../../data/model/abilities_model.dart';

class AbilitiesCard extends StatelessWidget {
  final AbilitiesModel abilitiesModel;

  const AbilitiesCard({super.key, required this.abilitiesModel});

  @override
  Widget build(BuildContext context) {
    final tablet = IsTablet.isTablet(context);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor),
        color: AppColor.cardOptionColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            abilitiesModel.displayName,
            style: TextStyle(
              fontSize: tablet ? 14.sp : 10.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                abilitiesModel.displayIcon,
                width: 35.w,
                height: 35.h,
                fit: BoxFit.contain,
                // لو الصورة فشلت في التحميل
                errorBuilder: (context, error, stackTrace) {
                  return Placeholder(fallbackHeight: 35.h, fallbackWidth: 35.w);
                },
              ),
              SizedBox(width: 7.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Type: ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: abilitiesModel.slot,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "Description: ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: abilitiesModel.description,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
