import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/core/widgets/connection_error.dart';
import 'package:valo/features/agents/UI/screens/widgets/agent_card.dart';
import '../../../../core/resources/app_color.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_options_data_page.dart';
import '../manager/agents_cubit.dart';
import '../manager/agents_state.dart';

class AgentsScreen extends StatelessWidget {
  const AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOptionsDataPage(
      body: RefreshIndicator(
        backgroundColor: AppColor.backgroundColor,
        color: AppColor.primaryColor,
        displacement: 100.h,
        onRefresh: () async {
          // استدعاء الدالة من الكيوبت لإعادة تحميل البيانات
          context.read<AgentsCubit>().getAgents();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          // ضروري مع RefreshIndicator
          child: Column(
            children: [
              const SizedBox(height: 26),
              CustomAppBar(title: "Agents"),
              BlocBuilder<AgentsCubit, AgentsState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.agents.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.6,
                            ),
                        itemBuilder: (context, index) {
                          return AgentCard(agentsModel: state.agents[index]);
                        },
                      ),
                    );
                  } else if (state is ErrorState) {
                    return const ConnectionError();
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
