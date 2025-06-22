import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_color.dart';
import '../../../../../core/services/is_tablet.dart';
import '../../../data/model/option_model.dart';

class OptionCard extends StatelessWidget {
  final OptionModel optionModel;

  const OptionCard({super.key, required this.optionModel});

  @override
  Widget build(BuildContext context) {
    final tablet = IsTablet.isTablet(context);

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, optionModel.routeName),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 14.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor),
          color: AppColor.cardOptionColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Text(
                optionModel.title,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontSize: tablet ? 22.sp : 16.sp,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
            ),
            Image.asset(
              optionModel.imagePath,
              width: tablet ? 152.w : 120.w,
              height: tablet ? 138.01.h : 110.h,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
