import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_anime_app/app/app_config.dart';
import 'package:re_anime_app/app/repository_container.dart';
import 'package:re_anime_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:re_anime_app/blocs/authorization_by_another_bloc/auth_by_another_bloc.dart';
import 'package:re_anime_app/blocs/logout_bloc/log_out_bloc.dart';
import 'package:re_anime_app/features/anime_details/bloc/anime_details_bloc.dart';
import 'package:re_anime_app/features/anime_lists/bloc/anime_lists_bloc.dart';
import 'package:re_anime_app/features/auth/login/bloc/login_bloc.dart';
import 'package:re_anime_app/features/auth/registration/bloc/registration_bloc.dart';
import 'package:re_anime_app/features/search/bloc/search_anime_bloc.dart';
import 'package:re_anime_app/repositories/anime/anime.dart';
import 'package:re_anime_app/repositories/user/user.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer(
      {super.key,
      required this.child,
      required this.config,
      required this.repositoryContainer});
  final Widget child;
  final AppConfig config;
  final RepositoryContainer repositoryContainer;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AnimeRepositoryInterface>(
              create: (context) => repositoryContainer.animeRepository),
          RepositoryProvider<UserRepositoryInterface>(
              create: (context) => repositoryContainer.userRepository)
        ],
        child: BlocProvider(
          create: (context) => AuthenticationBloc(
              userRepository: context.read<UserRepositoryInterface>()),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AnimeListsBloc(
                  animeRepository: context.read<AnimeRepositoryInterface>(),
                )..add(LoadAnimeListEvent()),
              ),
              BlocProvider(
                create: (context) => LoginBloc(
                  userRepository: context.read<UserRepositoryInterface>(),
                ),
              ),
              BlocProvider(
                create: (context) => RegistrationBloc(
                  userRepository: context.read<UserRepositoryInterface>(),
                ),
              ),
              BlocProvider(
                create: (context) => LogOutBloc(
                  userRepository: context.read<UserRepositoryInterface>(),
                ),
              ),
              BlocProvider(
                create: (context) => AuthByAnotherBloc(
                  userRepository: context.read<UserRepositoryInterface>(),
                ),
              ),
              BlocProvider(
                create: (context) => AnimeDetailsBloc(
                  animeRepository: context.read<AnimeRepositoryInterface>(),
                ),
              ),
              BlocProvider(
                create: (context) => SearchAnimeBloc(
                  animeRepository: context.read<AnimeRepositoryInterface>(),
                ),
              )
            ],
            child: child,
          ),
        ));
  }
}
