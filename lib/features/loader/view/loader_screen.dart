import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_anime_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:re_anime_app/blocs/settings_cubit/settings_cubit.dart';
import 'package:re_anime_app/router/router.dart';

@RoutePage()
class LoaderScreen extends StatelessWidget {
  const LoaderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        debugPrint("Authentication state updated: ${state.status}");

        WidgetsBinding.instance.addPostFrameCallback((_) {
          navigateTo(context, state);
        });

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }

  void navigateTo(BuildContext context, AuthenticationState state) {
    final router = AutoRouter.of(context);
    final settingsState =
        context.read<SettingsCubit>().state.isOnboardingShowing;

    if (settingsState == false) {
      debugPrint("Navigating to HomeRoute");
      router.replaceAll([OnboardingRoute()]);
    } else if (state.status == AuthenticationStatus.authenticated) {
      debugPrint("Navigating to HomeRoute");
      router.replaceAll([HomeRoute()]);
    } else if (state.status == AuthenticationStatus.unauthenticated) {
      debugPrint("Navigating to LoginRoute");
      router.replaceAll([const LoginRoute()]);
    }
  }
}
