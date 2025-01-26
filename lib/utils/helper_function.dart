import 'enums.dart';

String getFilterString(TopAnimeFilter? filter) {
  switch (filter) {
    case TopAnimeFilter.airing:
      return 'airing';
    case TopAnimeFilter.upcoming:
      return 'upcoming';
    case TopAnimeFilter.bypopularity:
      return 'bypopularity';
    case TopAnimeFilter.favorite:
      return 'favorite';
    default:
      return '';
  }
}

String getAnimeTypeString(AnimeType? type) {
  switch (type) {
    case AnimeType.tv:
      return 'tv';
    case AnimeType.movie:
      return 'movie';
    case AnimeType.ova:
      return 'ova';
    case AnimeType.special:
      return 'special';
    case AnimeType.ona:
      return 'ona';
    case AnimeType.music:
      return 'music';
    case AnimeType.cm:
      return 'cm';
    case AnimeType.tv_special:
      return 'tv_special';
    default:
      return '';
  }
}
