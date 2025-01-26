import 'package:re_anime_app/api/anime_api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  // final AppDatabase database;
  final SharedPreferences preferences;
  final AnimeApiClient animeApiClient;

  AppConfig({
    required this.preferences,
    required this.animeApiClient,
  });
}
