import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/agents/UI/manager/agent_details_cubit.dart';
import '../../features/agents/UI/manager/agents_cubit.dart';
import '../../features/agents/data/repo/agents_home_repo_impl.dart';
import '../../features/gun buddies/UI/manager/gun_buddies_cubit.dart';
import '../../features/gun buddies/data/repo/gun_buddies_home_repo_impl.dart';
import '../../features/maps/UI/manager/maps_cubit.dart';
import '../../features/maps/data/repo/maps_home_repo_impl.dart';
import '../../features/player cards/UI/manager/player_cards_cubit.dart';
import '../../features/player cards/data/repo/player_cards_home_repo_impl.dart';
import '../../features/sprays/UI/manager/sprays_cubit.dart';
import '../../features/sprays/data/repo/sprays_home_repo_impl.dart';
import '../../features/weapons/UI/manager/weapon_cubit.dart';
import '../../features/weapons/UI/manager/weapon_details_cubit.dart';
import '../../features/weapons/data/repo/weapon_home_repo_impl.dart';
import '../network/di.dart';

abstract class AppProvider {
  static final List<BlocProvider<dynamic>> appProvider = [
    BlocProvider<AgentsCubit>(
      create:
          (context) =>
              AgentsCubit(agentsHomeRepo: getIt.get<AgentsHomeRepoImpl>())
                ..getAgents(),
    ),
    BlocProvider<AgentDetailsCubit>(
      create:
          (context) => AgentDetailsCubit(
            agentsHomeRepo: getIt.get<AgentsHomeRepoImpl>(),
          ),
    ),
    BlocProvider<WeaponCubit>(
      create:
          (context) =>
              WeaponCubit(weaponHomeRepo: getIt.get<WeaponHomeRepoImpl>())
                ..getWeapons(),
    ),
    BlocProvider<WeaponDetailsCubit>(
      create:
          (context) => WeaponDetailsCubit(
            weaponHomeRepo: getIt.get<WeaponHomeRepoImpl>(),
          ),
    ),
    BlocProvider<PlayerCardsCubit>(
      create:
          (context) => PlayerCardsCubit(
            playerCardsHomeRepo: getIt.get<PlayerCardsHomeRepoImpl>(),
          )..getPlayerCards(),
    ),
    BlocProvider<GunBuddiesCubit>(
      create:
          (context) => GunBuddiesCubit(
            gunBuddiesHomeRepo: getIt.get<GunBuddiesHomeRepoImpl>(),
          )..getGunBuddies(),
    ),
    BlocProvider<MapsCubit>(
      create:
          (context) =>
              MapsCubit(mapsHomeRepo: getIt.get<MapsHomeRepoImpl>())..getMaps(),
    ),
    BlocProvider<SpraysCubit>(
      create:
          (context) =>
              SpraysCubit(spraysHomeRepo: getIt.get<SpraysHomeRepoImpl>())
                ..getSprays(),
    ),
  ];
}
