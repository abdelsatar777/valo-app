import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/features/ranks/UI/screens/widgets/rank_card.dart';
import '../../../../../core/resources/app_color.dart';

class RankSection extends StatelessWidget {
  final String title;
  final List<String> imageUrls;

  const RankSection({super.key, required this.title, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColor.primaryColor,
            fontSize: 16.sp,
            letterSpacing: -0.3,
          ),
        ),
        Wrap(
          spacing: 10, // المسافة الأفقية بين العناصر
          runSpacing: 12, // المسافة الرأسية بين الصفوف
          children:
              imageUrls.map((url) {
                return SizedBox(
                  width:
                      (MediaQuery.of(context).size.width - 60) /
                      3, // 3 صور في الصف
                  child: RankCard(imageUrl: url),
                );
              }).toList(),
        ),
        SizedBox(height: 22.h),
      ],
    );
  }
}
