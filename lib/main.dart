import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:re_anime_app/api/anime_api_client.dart';
import 'package:re_anime_app/app/app_config.dart';
import 'package:re_anime_app/app/re_anime_app.dart';
import 'package:re_anime_app/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  final animeClient = AnimeApiClient();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await _initPrefs();

  final AppConfig config =
      AppConfig(preferences: prefs, animeApiClient: animeClient);
  runApp(ReAnimeApp(
    config: config,
  ));
}

Future<SharedPreferences> _initPrefs() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs;
}
