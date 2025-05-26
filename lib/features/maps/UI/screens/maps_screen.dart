import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/features/maps/UI/screens/widgets/map_card.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/widgets/connection_error.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_options_data_page.dart';
import '../manager/maps_cubit.dart';
import '../manager/maps_state.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOptionsDataPage(
      body: RefreshIndicator(
        backgroundColor: AppColor.backgroundColor,
        color: AppColor.primaryColor,
        displacement: 100.h,
        onRefresh: () async {
          // استدعاء الدالة من الكيوبت لإعادة تحميل البيانات
          context.read<MapsCubit>().getMaps();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 26.h),
              CustomAppBar(title: "MAps"),
              BlocBuilder<MapsCubit, MapsState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return Padding(
                      padding: EdgeInsets.all(16.r),
                      child: GridView.builder(
                        itemCount: state.maps.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.79, // زى ما هو
                            ),
                        itemBuilder: (context, index) {
                          return MapCard(mapsModel: state.maps[index]);
                        },
                      ),
                    );
                  } else if (state is ErrorState) {
                    return ConnectionError();
                  } else {
                    return LinearProgressIndicator(color: AppColor.primaryColor);
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
