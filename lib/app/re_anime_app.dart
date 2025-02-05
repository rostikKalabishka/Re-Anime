import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:re_anime_app/app/app_config.dart';
import 'package:re_anime_app/app/app_initializer.dart';
import 'package:re_anime_app/app/repository_container.dart';
import 'package:re_anime_app/blocs/settings_cubit/settings_cubit.dart';

import 'package:re_anime_app/router/router.dart';
import 'package:re_anime_app/ui/ui.dart';

class ReAnimeApp extends StatefulWidget {
  const ReAnimeApp({
    super.key,
    required this.config,
  });

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
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Re:Anime',
            theme: state.isDark ? darkTheme : lightTheme,
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}
