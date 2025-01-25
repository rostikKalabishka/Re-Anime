import 'package:re_anime_app/api/models/anime.dart';

abstract interface class AnimeRepositoryInterface {
  Future<List<AnimeEntity>> getAnimeList();
  Future<AnimeEntity> getAnimeDetails();
}
