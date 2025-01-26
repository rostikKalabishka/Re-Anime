import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConfig {
  static String baseUrl = '${dotenv.env['BASE_URL']}';
}
