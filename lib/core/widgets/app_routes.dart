import '../../features/agents/UI/screens/agents_screen.dart';
import '../../features/gun buddies/UI/screens/gun_buddies_screen.dart';
import '../../features/home/UI/screens/home_screen.dart';
import '../../features/maps/UI/screens/maps_screen.dart';
import '../../features/player cards/UI/screens/player_cards_screen.dart';
import '../../features/ranks/UI/screens/ranks_screen.dart';
import '../../features/splash/UI/screens/splash_screen.dart';
import '../../features/sprays/UI/screens/sprays_screen.dart';
import '../../features/weapons/UI/screens/weapons_screen.dart';

abstract class AppRoutes {
  static var routesList = {
    //Pages
    "/splash_screen": (context) => SplashScreen(),
    "/home_screen": (context) => HomeScreen(),

    //Options Pages
    "/agents_screen": (context) => AgentsScreen(),
    "/weapons_screen": (context) => WeaponsScreen(),
    "/ranks_screen": (context) => RanksScreen(),
    "/sprays_screen": (context) => SpraysScreen(),
    "/player_cards_screen": (context) => PlayerCardsScreen(),
    "/maps_screen": (context) => MapsScreen(),
    "/gun_buddies_screen": (context) => GunBuddiesScreen(),
  };
}
