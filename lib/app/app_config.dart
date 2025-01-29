import 'package:re_anime_app/api/anime_api_client.dart';
import 'package:re_anime_app/api/user_api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  final SharedPreferences preferences;
  final AnimeApiClient animeApiClient;
  final UserApiClient userApiClient;

  AppConfig(
      {required this.preferences,
      required this.animeApiClient,
      required this.userApiClient});
}
