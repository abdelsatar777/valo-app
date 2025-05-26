import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/app_color.dart';

class DamageTable extends StatelessWidget {
  final List<Map<String, dynamic>> damageRanges;

  const DamageTable({super.key, required this.damageRanges});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'DAMAGE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 18.sp,
                  letterSpacing: -0.3,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _HeaderCell('RANGE'),
                  _HeaderCell('BODY'),
                  _HeaderCell('HEAD'),
                  _HeaderCell('LEG'),
                ],
              ),
              ...damageRanges.map((range) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _DataCell(
                        '${range["rangeStartMeters"]} - ${range["rangeEndMeters"]}',
                      ),
                      _DataCell('${range["bodyDamage"].round()}'),
                      _DataCell('${range["headDamage"].round()}'),
                      _DataCell('${range["legDamage"].round()}'),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        const Divider(color: Colors.white),
      ],
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;

  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColor.primaryColor,
        fontSize: 16.sp,
        letterSpacing: -0.3,
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String text;

  const _DataCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.sp,
        letterSpacing: -0.3,
      ),
    );
  }
}
