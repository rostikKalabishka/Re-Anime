import 'package:dio/dio.dart';

import '../utils/utils.dart';
import 'config/api_config.dart';
import 'models/models.dart';

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

        return animeDetails;
      } else {
        throw Exception('error');
      }
    } catch (e) {
      print("Error fetching anime details: $e");
      rethrow;
    }
  }

  Future<ListResponse> searchAnime(
      {required String query, required int page}) async {
    try {
      final animeListResponse = await _getAnimeList(
          url: '/anime', parameters: {"q": query, "page": page});

      return animeListResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AnimeEntity>> getUpcomingAnimeList() async {
    try {
      final animeListResponse = await _getAnimeList(url: '/seasons/upcoming');

      return animeListResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AnimeEntity>> getSeasonNowAnimeList() async {
    try {
      final animeListResponse =
          await _getAnimeList(url: '/seasons/now', parameters: {'limit': 25});

      return animeListResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AnimeEntity>> getTopAnime(
      {TopAnimeFilter? filter, AnimeType? type}) async {
    try {
      final animeListResponse = await _getAnimeList(
          url: '/top/anime',
          parameters: {
            'limit': 25,
            "filter": getFilterString(filter),
            "type": getAnimeTypeString(type)
          });

      return animeListResponse.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<ListResponse> _getAnimeList(
      {required String url, Map<String, dynamic>? parameters}) async {
    try {
      final response =
          await _dio.get(ApiConfig.baseUrl + url, queryParameters: parameters);

      if (response.statusCode == 200) {
        final json = response.data;

        if (json is Map<String, dynamic>) {
          final List<AnimeEntity> animeList = (json['data'] as List)
              .map((e) => AnimeEntity.fromJson(e as Map<String, dynamic>))
              .toList();
          final pagination = Pagination.fromJson(json['pagination']);
          return ListResponse(data: animeList, pagination: pagination);
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
