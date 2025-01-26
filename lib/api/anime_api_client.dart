import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:re_anime_app/api/models/anime.dart';

import '../utils/utils.dart';
import 'config/api_config.dart';

class AnimeApiClient {
  final _dio = Dio();

  Future<AnimeEntity> getAnimeDetails({required int animeId}) async {
    try {
      final response = await _dio.get(
        '${ApiConfig.baseUrl}/anime/$animeId',
      );

      if (response.statusCode == 200) {
        final json = response.data;

        final animeDetails =
            AnimeEntity.fromJson((json['data'] as Map<String, dynamic>));
        log(animeDetails.malId.toString());
        return animeDetails;
      } else {
        throw Exception('error');
      }
    } catch (e) {
      print("Error fetching anime details: $e");
      rethrow;
    }
  }

  Future<List<AnimeEntity>> getUpcomingAnimeList() async {
    try {
      final animeList =
          await _getAnimeList(url: '${ApiConfig.baseUrl}/seasons/upcoming');
      print(animeList[0].title);
      return animeList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AnimeEntity>> getSeasonNowAnimeList() async {
    try {
      final animeList = await _getAnimeList(
          url: '${ApiConfig.baseUrl}/seasons/now', parameters: {'limit': 25});

      return animeList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AnimeEntity>> getTopAnime(
      {TopAnimeFilter? filter, AnimeType? type}) async {
    try {
      final animeList = await _getAnimeList(
          url: '${ApiConfig.baseUrl}/top/anime',
          parameters: {
            'limit': 25,
            "filter": getFilterString(filter),
            "type": getAnimeTypeString(type)
          });

      return animeList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AnimeEntity>> _getAnimeList(
      {required String url, Map<String, dynamic>? parameters}) async {
    try {
      final response = await _dio.get(url, queryParameters: parameters);

      if (response.statusCode == 200) {
        final json = response.data;

        if (json['data'] is List) {
          final List<AnimeEntity> animeList = (json['data'] as List)
              .map((e) => AnimeEntity.fromJson(e as Map<String, dynamic>))
              .toList();

          return animeList;
        } else {
          throw Exception(
              "Unexpected data format in response: 'data' is not a list.");
        }
      } else {
        throw Exception(
            "Failed to fetch data, status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching anime details: $e");
      rethrow;
    }
  }
}
