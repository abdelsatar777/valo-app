import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/agents/data/repo/agents_home_repo_impl.dart';
import '../../features/gun buddies/data/repo/gun_buddies_home_repo_impl.dart';
import '../../features/maps/data/repo/maps_home_repo_impl.dart';
import '../../features/player cards/data/repo/player_cards_home_repo_impl.dart';
import '../../features/sprays/data/repo/sprays_home_repo_impl.dart';
import '../../features/weapons/data/repo/weapon_home_repo_impl.dart';
import 'api_service.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<AgentsHomeRepoImpl>(
    AgentsHomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<WeaponHomeRepoImpl>(
    WeaponHomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<PlayerCardsHomeRepoImpl>(
    PlayerCardsHomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<GunBuddiesHomeRepoImpl>(
    GunBuddiesHomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<MapsHomeRepoImpl>(
    MapsHomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<SpraysHomeRepoImpl>(
    SpraysHomeRepoImpl(apiService: getIt.get<ApiService>()),
  );
}
