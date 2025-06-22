import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/core/services/is_tablet.dart';
import 'package:valo/features/ranks/UI/screens/widgets/rank_section.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_options_data_page.dart';

class RanksScreen extends StatefulWidget {
  const RanksScreen({super.key});

  @override
  State<RanksScreen> createState() => _RanksScreenState();
}

class _RanksScreenState extends State<RanksScreen> {
  Future<void> _refreshRanks() async {
    // هنا تقدر تحط أي عملية تحديث حقيقية زي استدعاء Cubit/Bloc
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tablet = IsTablet.isTablet(context);
    return CustomOptionsDataPage(
      body: RefreshIndicator(
        backgroundColor: AppColor.backgroundColor,
        color: AppColor.primaryColor,
        displacement: 100.h,
        onRefresh: _refreshRanks,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: tablet ? 7.w : 16.w),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26.h),
                CustomAppBar(title: "Ranks"),
                SizedBox(height: 20.h),
                RankSection(
                  title: "UNRANKED",
                  imageUrls: [
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/0/largeicon.png",
                  ],
                ),
                RankSection(
                  title: "IRON",
                  imageUrls: [
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/3/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/4/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/5/largeicon.png",
                  ],
                ),
                RankSection(
                  title: "BRONZE",
                  imageUrls: [
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/6/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/7/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/8/largeicon.png",
                  ],
                ),
                RankSection(
                  title: "SILVER",
                  imageUrls: [
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/9/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/10/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/11/largeicon.png",
                  ],
                ),
                RankSection(
                  title: "GOLD",
                  imageUrls: [
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/12/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/13/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/14/largeicon.png",
                  ],
                ),
                RankSection(
                  title: "PLATINUM",
                  imageUrls: [
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/15/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/16/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/17/largeicon.png",
                  ],
                ),
                RankSection(
                  title: "DIAMOND",
                  imageUrls: [
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/18/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/19/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/20/largeicon.png",
                  ],
                ),
                RankSection(
                  title: "IMMORTAL",
                  imageUrls: [
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/21/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/22/largeicon.png",
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/23/largeicon.png",
                  ],
                ),
                RankSection(
                  title: "RADIANT",
                  imageUrls: [
                    "https://media.valorant-api.com/competitivetiers/564d8e28-c226-3180-6285-e48a390db8b1/24/largeicon.png",
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
