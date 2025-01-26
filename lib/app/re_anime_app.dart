// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:re_anime_app/app/app_config.dart';
import 'package:re_anime_app/app/app_initializer.dart';
import 'package:re_anime_app/app/repository_container.dart';
import 'package:re_anime_app/features/anime_lists/view/anime_lists_screen.dart';
import 'package:re_anime_app/features/auth/login/view/login_screen.dart';
import 'package:re_anime_app/features/favorites/view/user_list_screen.dart';
import 'package:re_anime_app/features/home/view/home_screen.dart';
import 'package:re_anime_app/features/search/view/search_screen.dart';
import 'package:re_anime_app/router/router.dart';
import 'package:re_anime_app/ui/ui.dart';

import '../features/auth/registration/view.dart';

class ReAnimeApp extends StatefulWidget {
  const ReAnimeApp({
    Key? key,
    required this.config,
  }) : super(key: key);

  final AppConfig config;
  @override
  State<ReAnimeApp> createState() => _ReAnimeAppState();
}

class _ReAnimeAppState extends State<ReAnimeApp> {
  final _router = AppRouter();
  @override
  Widget build(BuildContext context) {
    final repositoryContainer = RepositoryContainer.dev(
      config: widget.config,
    );
    return AppInitializer(
      config: widget.config,
      repositoryContainer: repositoryContainer,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Re:Anime',
        theme: darkTheme,
        routerConfig: _router.config(),
      ),
    );
  }
}
