import 'package:re_anime_app/app/app_config.dart';
import 'package:re_anime_app/repositories/anime/anime.dart';
import 'package:re_anime_app/repositories/settings/settings.dart';
import 'package:re_anime_app/repositories/user/user_repository.dart';
import 'package:re_anime_app/repositories/user/user_repository_interface.dart';

class RepositoryContainer {
  final AnimeRepositoryInterface animeRepository;
  final UserRepositoryInterface userRepository;
  final SettingsRepositoryInterface settingsRepository;

  RepositoryContainer({
    required this.animeRepository,
    required this.userRepository,
    required this.settingsRepository,
  });

  factory RepositoryContainer.prod({
    required AppConfig config,
  }) =>
      RepositoryContainer(
        animeRepository: AnimeRepository(apiClient: config.animeApiClient),
        userRepository: UserRepository(userApiClient: config.userApiClient),
        settingsRepository:
            SettingsRepository(sharedPreferences: config.preferences),
      );

  factory RepositoryContainer.dev({
    required AppConfig config,
  }) =>
      RepositoryContainer(
        animeRepository: AnimeRepository(apiClient: config.animeApiClient),
        userRepository: UserRepository(userApiClient: config.userApiClient),
        settingsRepository:
            SettingsRepository(sharedPreferences: config.preferences),
      );
}
