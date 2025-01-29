import 'package:re_anime_app/app/app_config.dart';
import 'package:re_anime_app/repositories/anime/anime.dart';
import 'package:re_anime_app/repositories/user/user_repository.dart';
import 'package:re_anime_app/repositories/user/user_repository_interface.dart';

class RepositoryContainer {
  final AnimeRepositoryInterface animeRepository;
  final UserRepositoryInterface userRepository;

  RepositoryContainer(
      {required this.animeRepository, required this.userRepository});

  factory RepositoryContainer.prod({
    required AppConfig config,
  }) =>
      RepositoryContainer(
        animeRepository: AnimeRepository(apiClient: config.animeApiClient),
        userRepository: UserRepository(userApiClient: config.userApiClient),
      );

  factory RepositoryContainer.dev({
    required AppConfig config,
  }) =>
      RepositoryContainer(
        animeRepository: AnimeRepository(apiClient: config.animeApiClient),
        userRepository: UserRepository(userApiClient: config.userApiClient),
      );
}
