import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valo/features/home/UI/screens/widgets/option_card.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/widgets/is_tablet.dart';
import '../../data/model/option_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tablet = IsTablet.isTablet(context);
    //Option Data List (Title & Image & Route Name)
    List<OptionModel> optionData = [
      OptionModel(
        routeName: "/agents_screen",
        title: "agents",
        imagePath: AppAssets.agentsImg,
      ),
      OptionModel(
        routeName: "/weapons_screen",
        title: "Weapons",
        imagePath: AppAssets.weaponsImg,
      ),
      OptionModel(
        routeName: "/ranks_screen",
        title: "RANKS",
        imagePath: AppAssets.ranksImg,
      ),
      OptionModel(
        routeName: "/sprays_screen",
        title: "Sprays",
        imagePath: AppAssets.spraysImg,
      ),
      OptionModel(
        routeName: "/player_cards_screen",
        title: "Player Cards",
        imagePath: AppAssets.playerCardsImg,
      ),
      OptionModel(
        routeName: "/maps_screen",
        title: "maps",
        imagePath: AppAssets.mapsImg,
      ),
      OptionModel(
        routeName: "/gun_buddies_screen",
        title: "gun buddies",
        imagePath: AppAssets.gunBuddiesImg,
      ),
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 26.h)),
          //Page Title
          SliverToBoxAdapter(
            child: Text(
              "valorant guide",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: tablet ? 22.sp : 16.sp,
                letterSpacing: -0.3,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          //Option List
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return OptionCard(optionModel: optionData[index]);
            }, childCount: optionData.length),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 20.h)),
        ],
      ),
    );
  }
}
