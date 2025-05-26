import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/features/player%20cards/UI/screens/widgets/player_cards_card.dart';

import '../../../../core/resources/app_color.dart';
import '../../../../core/widgets/connection_error.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_options_data_page.dart';
import '../manager/player_cards_cubit.dart';
import '../manager/player_cards_state.dart';

class PlayerCardsScreen extends StatelessWidget {
  const PlayerCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOptionsDataPage(
      body: RefreshIndicator(
        backgroundColor: AppColor.backgroundColor,
        color: AppColor.primaryColor,
        displacement: 100.h,
        onRefresh: () async {
          // استدعاء الدالة من الكيوبت لإعادة تحميل البيانات
          context.read<PlayerCardsCubit>().getPlayerCards();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 26),
              CustomAppBar(title: "Player Cards"),
              BlocBuilder<PlayerCardsCubit, PlayerCardsState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 120,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 0.42,
                            ),
                        itemBuilder: (context, index) {
                          return PlayerCardsCard(
                            playerCardsModel: state.playerCardsModel[index],
                          );
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
