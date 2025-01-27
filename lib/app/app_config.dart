import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:re_anime_app/api/anime_api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  // final AppDatabase database;
  final SharedPreferences preferences;
  final AnimeApiClient animeApiClient;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AppConfig(
      {required this.preferences,
      required this.animeApiClient,
      required this.firebaseAuth,
      required this.firebaseFirestore});
}
