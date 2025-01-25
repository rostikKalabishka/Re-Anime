import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:re_anime_app/api/models/anime.dart';

import 'config/api_config.dart';

class AnimeApiClient {
  final _dio = Dio();

  Future<AnimeEntity> getAnimeDetails() async {
    try {
      final response = await _dio.get('${ApiConfig.baseAnimeUrl}/123');

      if (response.statusCode == 200) {
        final json = response.data;

        final animeDetails =
            AnimeEntity.fromJson((json['data'] as Map<String, dynamic>));
        log(animeDetails.title ?? 'biba ');
        return animeDetails;
      } else {
        throw Exception('error');
      }
    } catch (e) {
      print("Error fetching anime details: $e");
      rethrow;
    }
  }

  Future<List<AnimeEntity>> getAnimeList() async {
    try {
      final response = await _dio.get('${ApiConfig.baseAnimeUrl}');

      if (response.statusCode == 200) {
        final json = response.data;

        if (json['data'] is List) {
          final List<AnimeEntity> animeList = (json['data'] as List)
              .map((e) => AnimeEntity.fromJson(e as Map<String, dynamic>))
              .toList();

          print(animeList[5]);
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
