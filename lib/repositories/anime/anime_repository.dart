import 'package:re_anime_app/api/anime_api_client.dart';

import 'package:re_anime_app/api/models/models.dart';
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

      List<AnimeEntity> uniqueAnimeList = uniqueList(animeList);

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
  Future<ListResponse> searchAnime(
      {required String query, required int page}) async {
    final animeListResponse =
        await apiClient.searchAnime(query: query, page: page);
    return animeListResponse;
  }
}
