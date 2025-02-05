import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:re_anime_app/blocs/logout_bloc/log_out_bloc.dart';
import 'package:re_anime_app/router/router.dart';
import 'package:re_anime_app/ui/ui.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'Settings',
              style: theme.textTheme.headlineSmall,
            ),
          ),
          BlocConsumer<LogOutBloc, LogOutState>(
            listener: (BuildContext context, state) {
              if (state is LogOutSuccess) {
                AutoRouter.of(context).pushAndPopUntil(LoaderRoute(),
                    predicate: (router) => false);
              }
            },
            builder: (context, state) {
              return SliverToBoxAdapter(
                child: BaseButtonWidget(
                    onPressed: () {
                      context.read<LogOutBloc>().add(LogOutEvent());
                    },
                    child: Row(
                      children: [
                        Text('Log out'),
                      ],
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
