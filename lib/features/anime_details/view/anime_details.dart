// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:re_anime_app/features/anime_details/bloc/anime_details_bloc.dart';
import 'package:re_anime_app/features/anime_details/widgets/widgets.dart';
import 'package:re_anime_app/ui/ui.dart';
import 'package:re_anime_app/utils/utils.dart';

@RoutePage()
class AnimeDetailsScreen extends StatefulWidget {
  const AnimeDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<AnimeDetailsScreen> createState() => _AnimeDetailsScreenState();
}

class _AnimeDetailsScreenState extends State<AnimeDetailsScreen> {
  Color shadowColorImage = Colors.transparent;
  @override
  void initState() {
    context.read<AnimeDetailsBloc>().add(LoadAnimeDetailsEvent(id: widget.id));

    super.initState();
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<AnimeDetailsBloc, AnimeDetailsState>(
      listener: (context, state) {
        if (state is AnimeDetailsLoaded) {
          _updateShadowColor(state);
        }
      },
      builder: (context, state) {
        if (state is AnimeDetailsLoaded) {
          final score = state.animeDetails.score ?? 0;
          final viewers = formatter(
            state.animeDetails.members,
          );
          final favorites = formatter(
            state.animeDetails.favorites,
          );

          return Scaffold(
            body: Stack(
              children: [
                Image.network(
                  state.animeDetails.images?.jpg?.imageUrl ?? '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      pinned: true,
                      title: Text(
                        state.animeDetails.titleEnglish ??
                            state.animeDetails.title ??
                            'None',
                        style: theme.textTheme.headlineSmall,
                      ),
                      actions: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              color: AppColors.primaryColors,
                            ))
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Column(
                          spacing: 16,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: shadowColorImage,
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(0, -3),
                                    ),
                                    BoxShadow(
                                      color: shadowColorImage,
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  state.animeDetails.images?.jpg?.imageUrl ??
                                      '',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              state.animeDetails.titleEnglish ??
                                  state.animeDetails.title ??
                                  'None',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.headlineSmall,
                            ),
                            AnimeDetailsStats(
                                score: score,
                                rank: state.animeDetails.rank ?? 0,
                                viewers: viewers,
                                favorites: favorites),
                            state.animeDetails.synopsis != null
                                ? Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Synopsis",
                                      style: theme.textTheme.headlineSmall,
                                    ),
                                  )
                                : SizedBox.shrink(),
                            state.animeDetails.synopsis != null
                                ? Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      state.animeDetails.synopsis ?? '',
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        } else if (state is AnimeDetailsFailure) {
          return Scaffold(
              body: Center(
            child: Text(state.error.toString()),
          ));
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }

  Future<void> _updateShadowColor(AnimeDetailsLoaded state) async {
    final defaultImage = state.animeDetails.images?.jpg?.imageUrl;

    if (defaultImage != null) {
      final color = await updatePaletteGenerator(url: defaultImage);

      if (color != null) {
        shadowColorImage = color;
      }
      setState(() {});
    }
  }
}
