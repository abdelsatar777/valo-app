import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/app_color.dart';
import '../../../../../core/services/is_tablet.dart';
import '../../../data/model/agents_model.dart';
import '../agent_details.dart';

class AgentCard extends StatelessWidget {
  final AgentsModel agentsModel;

  const AgentCard({super.key, required this.agentsModel});

  @override
  Widget build(BuildContext context) {
    final tablet = IsTablet.isTablet(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AgentDetails(id: agentsModel.id),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColor.cardOptionColor,
          border: Border.all(color: AppColor.primaryColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              agentsModel.displayName,
              textAlign: TextAlign.center,
              softWrap: true,
              style: TextStyle(
                fontSize: tablet ? 18.sp : 14.sp,
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
            Flexible(
              child: Image.network(
                "https://media.valorant-api.com/agents/${agentsModel.id}/fullportrait.png",
                width: 160.w,
                height: 270.h,
                fit: BoxFit.cover,
                // لو الصورة فشلت في التحميل
                errorBuilder: (context, error, stackTrace) {
                  return const Placeholder();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
