import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:re_anime_app/api/models/models.dart';

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

Future<Color?> updatePaletteGenerator({required String url}) async {
  var palette = await PaletteGenerator.fromImageProvider(NetworkImage(url));

  return palette.dominantColor?.color;
}

String formatter(int? number) {
  if (number == null) {
    return '0';
  } else if (number > 1000000) {
    return '${(number / 1000000).toStringAsFixed(2)}kk';
  } else if (number > 1000) {
    return '${number ~/ 1000}k';
  } else {
    return '$number';
  }
}

List<AnimeEntity> uniqueList(List<AnimeEntity> animeList) {
  final uniqueAnimeList = <AnimeEntity>[];
  final seenIds = <int>{};

  for (var anime in animeList) {
    if (!seenIds.contains(anime.malId)) {
      uniqueAnimeList.add(anime);
      seenIds.add(anime.malId);
    }
  }
  return uniqueAnimeList;
}
