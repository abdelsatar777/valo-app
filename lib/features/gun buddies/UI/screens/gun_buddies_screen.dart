import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/features/gun%20buddies/UI/screens/widgets/gun_buddies_card.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/widgets/connection_error.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_options_data_page.dart';
import '../manager/gun_buddies_cubit.dart';
import '../manager/gun_buddies_state.dart';

class GunBuddiesScreen extends StatelessWidget {
  const GunBuddiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOptionsDataPage(
      body: RefreshIndicator(
        backgroundColor: AppColor.backgroundColor,
        color: AppColor.primaryColor,
        displacement: 100.h,
        onRefresh: () async {
          // استدعاء الدالة من الكيوبت لإعادة تحميل البيانات
          context.read<GunBuddiesCubit>().getGunBuddies();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 26.h),
              CustomAppBar(title: "Gun Buddies"),
              BlocBuilder<GunBuddiesCubit, GunBuddiesState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.builder(
                        itemCount: 100,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.8,
                            ),
                        itemBuilder: (context, index) {
                          return GunBuddiesCard(
                            gunBuddiesModel: state.gunBuddies[index],
                          );
                        },
                      ),
                    );
                  } else if (state is ErrorState) {
                    return ConnectionError();
                  } else {
                    return LinearProgressIndicator(
                      color: AppColor.primaryColor,
                    );
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
