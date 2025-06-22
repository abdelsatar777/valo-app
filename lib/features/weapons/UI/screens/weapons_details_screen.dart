import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/features/weapons/UI/screens/widgets/damage_table.dart';
import 'package:valo/features/weapons/UI/screens/widgets/skins_card.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_options_data_page.dart';
import '../../../../core/widgets/custom_row_text.dart';
import '../../../../core/services/is_tablet.dart';
import '../manager/weapon_details_cubit.dart';
import '../manager/weapon_details_state.dart';

class WeaponsDetailsScreen extends StatefulWidget {
  final String id;

  const WeaponsDetailsScreen({super.key, required this.id});

  @override
  State<WeaponsDetailsScreen> createState() => _WeaponsDetailsScreenState();
}

class _WeaponsDetailsScreenState extends State<WeaponsDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeaponDetailsCubit>().getWeaponDetails(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final tablet = IsTablet.isTablet(context);

    return BlocBuilder<WeaponDetailsCubit, WeaponDetailsState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return CustomOptionsDataPage(
            body: Stack(
              children: [
                //Background
                Positioned(
                  top: tablet ? -170 : -110,
                  right: tablet ? -300 : -190,
                  child: Transform.rotate(
                    angle: 0.7,
                    child: Container(
                      color: AppColor.primaryColor,
                      width: 500.w,
                      height: 300.h,
                    ),
                  ),
                ),

                //Content
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: CustomScrollView(
                    slivers: [
                      //App Bar
                      SliverToBoxAdapter(
                        child: CustomAppBar(title: "Weapon details"),
                      ),

                      //Weapons Image
                      SliverToBoxAdapter(
                        child: Image.network(
                          state.weaponsDetailsModel.displayIcon,
                          height: 200,
                          fit: BoxFit.contain,
                          // لو الصورة فشلت في التحميل
                          errorBuilder: (context, error, stackTrace) {
                            return const Placeholder();
                          },
                        ),
                      ),

                      //Details
                      SliverToBoxAdapter(
                        child: CustomRowText(
                          text1: "Name:",
                          text2: state.weaponsDetailsModel.displayName,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomRowText(
                          text1: "Magazine:",
                          text2:
                              state
                                  .weaponsDetailsModel
                                  .weaponStatsModel
                                  .magazineSize,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomRowText(
                          text1: "wall penetration:",
                          text2:
                              state
                                  .weaponsDetailsModel
                                  .weaponStatsModel
                                  .wallPenetration
                                  .split('::')
                                  .last,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomRowText(
                          text1: "Fire mode:",
                          text2:
                              state
                                  .weaponsDetailsModel
                                  .weaponStatsModel
                                  .fireMode
                                  .split('::')
                                  .last,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomRowText(
                          text1: "Fire Rate:",
                          text2:
                              state
                                  .weaponsDetailsModel
                                  .weaponStatsModel
                                  .fireRate,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child:
                            state
                                    .weaponsDetailsModel
                                    .weaponStatsModel
                                    .damageRanges
                                    .isEmpty
                                ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "No damage Ranges",
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: -0.3,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Divider(color: Colors.white),
                                    const SizedBox(height: 5),
                                  ],
                                )
                                : DamageTable(
                                  damageRanges:
                                      state
                                          .weaponsDetailsModel
                                          .weaponStatsModel
                                          .damageRanges,
                                ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "SKINS:",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 16.sp,
                                letterSpacing: -0.3,
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              height: 120.h,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    state.weaponsDetailsModel.skinsModel.length,
                                itemBuilder: (context, index) {
                                  return SkinsCard(
                                    imgPath:
                                        state
                                            .weaponsDetailsModel
                                            .skinsModel[index]
                                            .displayIcon,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else if (state is ErrorState) {
          return Center(child: Text("Error ${state.errorMsg}"));
        } else {
          return Center(
            child: CircularProgressIndicator(color: AppColor.primaryColor),
          );
        }
      },
    );
  }
}
