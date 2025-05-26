import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/features/weapons/UI/screens/widgets/weapons_card.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/widgets/connection_error.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_options_data_page.dart';
import '../manager/weapon_cubit.dart';
import '../manager/weapon_state.dart';

class WeaponsScreen extends StatelessWidget {
  const WeaponsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOptionsDataPage(
      body: RefreshIndicator(
        backgroundColor: AppColor.backgroundColor,
        color: AppColor.primaryColor,
        displacement: 100.h,
        onRefresh: () async {
          // استدعاء الدالة من الكيوبت لإعادة تحميل البيانات
          context.read<WeaponCubit>().getWeapons();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 26),
              CustomAppBar(title: "Weapons"),
              BlocBuilder<WeaponCubit, WeaponState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.weapons.length,
                        itemBuilder: (context, index) {
                          return WeaponsCard(weaponsModel: state.weapons[index]);
                        },
                      ),
                    );
                  } else if (state is ErrorState) {
                    return ConnectionError();
                  } else {
                    return LinearProgressIndicator(color: AppColor.primaryColor)
                    //Other
                    /*Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primaryColor,
                      ),
                    )*/
                    ;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
