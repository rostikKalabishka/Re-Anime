import 'package:re_anime_app/app/app_config.dart';
import 'package:re_anime_app/repositories/anime/anime.dart';

class RepositoryContainer {
  final AnimeRepositoryInterface animeRepository;

  RepositoryContainer({required this.animeRepository});

  factory RepositoryContainer.prod({
    required AppConfig config,
  }) =>
      RepositoryContainer(
        animeRepository: AnimeRepository(apiClient: config.animeApiClient),
      );

  factory RepositoryContainer.dev({
    required AppConfig config,
  }) =>
      RepositoryContainer(
          animeRepository: AnimeRepository(apiClient: config.animeApiClient));
}
