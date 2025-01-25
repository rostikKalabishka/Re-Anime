import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConfig {
  static String baseAnimeUrl = '${dotenv.env['ANIME_API_URL']}';
}
