import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

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
  log(url.toString());
  return palette.dominantColor?.color;
}

// String convertToString(
//     {required num? dividend,
//     required num divisor,
//     required int? toStringAsFixed}) {
//   String result = '0';
//   if (dividend != null && dividend > 1000) {
//     result = (dividend / divisor).toStringAsFixed(toStringAsFixed ?? 0);
//   } else {
//     result = dividend != null ? dividend.toString() : '0';
//   }

//   return result;
// }

String formatter(int? number) {
  if (number == null) {
    return '0';
  } else if (number > 1000) {
    return '${number ~/ 1000}k';
  } else {
    return '$number';
  }
}
