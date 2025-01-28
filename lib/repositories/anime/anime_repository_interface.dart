import 'package:re_anime_app/api/models/models.dart';

abstract interface class AnimeRepositoryInterface {
  Future<List<AnimeEntity>> getSeasonNowAnimeList();
  Future<List<AnimeEntity>> getUpcomingAnimeList();
  Future<List<AnimeEntity>> getTopMovieAnime();
  Future<List<AnimeEntity>> getTopPopularAnime();
  Future<ListResponse> searchAnime({required String query, required int page});
  Future<AnimeEntity> getAnimeDetails({required int animeId});
}
