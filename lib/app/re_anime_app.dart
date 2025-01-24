import 'package:flutter/material.dart';
import 'package:re_anime_app/features/anime_lists/view/anime_lists_screen.dart';
import 'package:re_anime_app/features/auth/login/view/login_screen.dart';
import 'package:re_anime_app/features/favorites/view/user_list_screen.dart';
import 'package:re_anime_app/features/home/view/home_screen.dart';
import 'package:re_anime_app/features/search/view/search_screen.dart';
import 'package:re_anime_app/router/router.dart';
import 'package:re_anime_app/ui/ui.dart';

import '../features/auth/registration/view.dart';

class ReAnimeApp extends StatefulWidget {
  const ReAnimeApp({super.key});

  @override
  State<ReAnimeApp> createState() => _ReAnimeAppState();
}

class _ReAnimeAppState extends State<ReAnimeApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Re:Anime',
      theme: darkTheme,
      routerConfig: _router.config(),
    );
  }
}
