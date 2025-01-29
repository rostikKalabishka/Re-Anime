import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_anime_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:re_anime_app/router/router.dart';

@RoutePage()
class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        navigateTo(context, state);
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }

  void navigateTo(BuildContext context, AuthenticationState state) {
    if (state.status == AuthenticationStatus.authenticated) {
      AutoRouter.of(context)
          .pushAndPopUntil(HomeRoute(), predicate: (router) => false);
    } else {
      AutoRouter.of(context)
          .pushAndPopUntil(const LoginRoute(), predicate: (router) => false);
    }
  }
}
