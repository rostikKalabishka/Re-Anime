import 'package:re_anime_app/api/models/anime.dart';

abstract interface class AnimeRepositoryInterface {
  Future<List<AnimeEntity>> getSeasonNowAnimeList();
  Future<List<AnimeEntity>> getUpcomingAnimeList();
  Future<List<AnimeEntity>> getTopMovieAnime();
  Future<List<AnimeEntity>> getTopPopularAnime();
  Future<AnimeEntity> getAnimeDetails({required int animeId});
}
