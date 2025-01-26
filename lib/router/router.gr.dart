// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AnimeDetailsScreen]
class AnimeDetailsRoute extends PageRouteInfo<AnimeDetailsRouteArgs> {
  AnimeDetailsRoute({Key? key, required int id, List<PageRouteInfo>? children})
    : super(
        AnimeDetailsRoute.name,
        args: AnimeDetailsRouteArgs(key: key, id: id),
        initialChildren: children,
      );

  static const String name = 'AnimeDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AnimeDetailsRouteArgs>();
      return AnimeDetailsScreen(key: args.key, id: args.id);
    },
  );
}

class AnimeDetailsRouteArgs {
  const AnimeDetailsRouteArgs({this.key, required this.id});

  final Key? key;

  final int id;

  @override
  String toString() {
    return 'AnimeDetailsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [AnimeListsScreen]
class AnimeListsRoute extends PageRouteInfo<void> {
  const AnimeListsRoute({List<PageRouteInfo>? children})
    : super(AnimeListsRoute.name, initialChildren: children);

  static const String name = 'AnimeListsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AnimeListsScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoaderScreen]
class LoaderRoute extends PageRouteInfo<void> {
  const LoaderRoute({List<PageRouteInfo>? children})
    : super(LoaderRoute.name, initialChildren: children);

  static const String name = 'LoaderRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoaderScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [RegistrationScreen]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute({List<PageRouteInfo>? children})
    : super(RegistrationRoute.name, initialChildren: children);

  static const String name = 'RegistrationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegistrationScreen();
    },
  );
}

/// generated route for
/// [SearchScreen]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [UserFavoritesListScreen]
class UserFavoritesListRoute extends PageRouteInfo<void> {
  const UserFavoritesListRoute({List<PageRouteInfo>? children})
    : super(UserFavoritesListRoute.name, initialChildren: children);

  static const String name = 'UserFavoritesListRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const UserFavoritesListScreen();
    },
  );
}
