import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:re_anime_app/api/models/anime.dart';
import 'package:re_anime_app/ui/ui.dart';

@RoutePage()
class UserFavoritesListScreen extends StatelessWidget {
  const UserFavoritesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: theme.cardColor,
            title: Text(
              'My Anime List',
              style: theme.textTheme.headlineSmall,
            ),
          ),
          SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: _size.height / 4,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return Container();
              })
        ],
      ),
    );
  }
}
