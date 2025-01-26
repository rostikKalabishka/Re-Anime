import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:re_anime_app/features/anime_details/view/anime_details.dart';
import 'package:re_anime_app/features/anime_lists/view/anime_lists_screen.dart';
import 'package:re_anime_app/features/auth/login/view/login_screen.dart';
import 'package:re_anime_app/features/auth/registration/view/registration_screen.dart';
import 'package:re_anime_app/features/favorites/view/user_list_screen.dart';
import 'package:re_anime_app/features/home/view/home_screen.dart';
import 'package:re_anime_app/features/loader/view/loader_screen.dart';
import 'package:re_anime_app/features/search/view/search_screen.dart';
import 'package:re_anime_app/features/settings/view/settings_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, path: '/', children: [
          AutoRoute(page: AnimeListsRoute.page, path: 'anime_lists'),
          AutoRoute(page: UserListRoute.page, path: 'user_list'),
          AutoRoute(page: SearchRoute.page, path: 'search'),
          AutoRoute(page: SettingsRoute.page, path: 'settings'),
          // AutoRoute(page: AnimeDetailsRoute.page, path: 'anime_details'),
        ]),
        AutoRoute(page: AnimeDetailsRoute.page, path: '/anime_details'),
      ];
}
