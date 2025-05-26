import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_color.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_options_data_page.dart';
import '../../../../core/widgets/custom_row_text.dart';
import '../../../../core/widgets/is_tablet.dart';
import 'widgets/abilities_card.dart';
import '../manager/agent_details_cubit.dart';
import '../manager/agent_details_state.dart';

class AgentDetails extends StatefulWidget {
  final String id;

  const AgentDetails({super.key, required this.id});

  @override
  State<AgentDetails> createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
  @override
  void initState() {
    super.initState();
    context.read<AgentDetailsCubit>().getAgentDetails(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final tablet = IsTablet.isTablet(context);

    return BlocBuilder<AgentDetailsCubit, AgentDetailsState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return CustomOptionsDataPage(
            body: Stack(
              fit: StackFit.expand,
              children: [
                //Background
                Positioned.fill(
                  child: Image.network(
                    "https://media.valorant-api.com/agents/${widget.id}/background.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    color: AppColor.backgroundColor.withOpacity(0.9),
                  ),
                ),

                //Content
                Padding(
                  padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 20.h),
                  child: CustomScrollView(
                    slivers: [
                      //App Bar
                      SliverToBoxAdapter(
                        child: CustomAppBar(title: "Agent details"),
                      ),

                      //Agent Image
                      SliverToBoxAdapter(
                        child: Image.network(
                          state.agentDetails.fullPortrait,
                          width: tablet ? 160.w : 100.w,
                          height: tablet ? 270.h : 220.h,
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
                          text2: state.agentDetails.displayName,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: CustomRowText(
                          text1: "type:",
                          text2: state.agentDetails.roleModel.displayName,
                          iconPath: state.agentDetails.roleModel.displayIcon,
                          showIcon: true,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Description: ",
                                style: TextStyle(
                                  fontSize: 12.sp, // مثال، عدله حسب التصميم
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: state.agentDetails.description,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  // برضو عدله حسب الشكل المناسب
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: Divider(color: Colors.white),
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: 30.h)),
                      SliverToBoxAdapter(
                        child: Text(
                          "Abilities",
                          style: TextStyle(
                            fontSize: tablet ? 16.sp : 12.sp,
                            letterSpacing: -0.3,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return AbilitiesCard(
                              abilitiesModel:
                                  state.agentDetails.abilitiesModel[index],
                            );
                          },
                          childCount: state.agentDetails.abilitiesModel.length,
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
