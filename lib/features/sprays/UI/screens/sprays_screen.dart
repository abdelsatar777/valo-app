import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/features/sprays/UI/screens/widgets/sprays_card.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/widgets/connection_error.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_options_data_page.dart';
import '../manager/sprays_cubit.dart';
import '../manager/sprays_state.dart';

class SpraysScreen extends StatelessWidget {
  const SpraysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOptionsDataPage(
      body: RefreshIndicator(
        backgroundColor: AppColor.backgroundColor,
        color: AppColor.primaryColor,
        displacement: 100.h,
        onRefresh: () async {
          // استدعاء الدالة من الكيوبت لإعادة تحميل البيانات
          context.read<SpraysCubit>().getSprays();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 26),
              CustomAppBar(title: "Sprays"),
              BlocBuilder<SpraysCubit, SpraysState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.builder(
                        itemCount: 150,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 1,
                            ),
                        itemBuilder: (context, index) {
                          return SpraysCard(spraysModel: state.sprays[index]);
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
