import 'package:re_anime_app/api/anime_api_client.dart';
import 'package:re_anime_app/api/models/anime.dart';
import 'package:re_anime_app/repositories/anime/anime_repository_interface.dart';
import 'package:re_anime_app/utils/utils.dart';

class AnimeRepository implements AnimeRepositoryInterface {
  final AnimeApiClient apiClient;

  AnimeRepository({required this.apiClient});

  @override
  Future<AnimeEntity> getAnimeDetails({required int animeId}) async {
    try {
      final animeDetails = await apiClient.getAnimeDetails(animeId: animeId);
      return animeDetails;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AnimeEntity>> getSeasonNowAnimeList() async {
    try {
      final animeList = await apiClient.getSeasonNowAnimeList();
      return animeList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AnimeEntity>> getUpcomingAnimeList() async {
    try {
      final animeList = await apiClient.getTopAnime(
        filter: TopAnimeFilter.upcoming,
      );

      final uniqueAnimeList = <AnimeEntity>[];
      final seenIds = <int>{};

      for (var anime in animeList) {
        if (!seenIds.contains(anime.malId)) {
          uniqueAnimeList.add(anime);
          seenIds.add(anime.malId);
        }
      }

      return uniqueAnimeList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AnimeEntity>> getTopMovieAnime() async {
    final animeList = await apiClient.getTopAnime(type: AnimeType.movie);
    return animeList;
  }

  @override
  Future<List<AnimeEntity>> getTopPopularAnime() async {
    final animeList =
        await apiClient.getTopAnime(filter: TopAnimeFilter.favorite);
    return animeList;
  }

  @override
  Future<List<AnimeEntity>> searchAnime({required String query}) async {
    final animeList = await apiClient.searchAnime(query: query);
    return animeList;
  }
}
