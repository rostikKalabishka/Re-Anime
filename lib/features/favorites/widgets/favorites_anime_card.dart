import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:re_anime_app/api/models/models.dart';
import 'package:re_anime_app/router/router.dart';
import 'package:re_anime_app/ui/ui.dart';

class FavoritesAnimeCard extends StatelessWidget {
  const FavoritesAnimeCard(
      {super.key, required this.anime, required this.isFavorite});
  final AnimeEntity anime;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final year = anime.aired?.from != null
        ? DateTime.parse(anime.aired!.from!).year.toString()
        : 'None';
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(AnimeDetailsRoute(id: anime.malId));
      },
      child: BaseContainerWidget(
        containerColor: Colors.transparent,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                anime.images?.jpg?.imageUrl ??
                    "https://cdn.myanimelist.net/images/anime/1437/115925.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            anime.aired?.from != null && anime.score != null
                ? Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: BaseContainerWidget(
                      containerColor: Colors.black87,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            year,
                            style: theme.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Row(children: [
                            // Icon(
                            //   Icons.star,
                            //   color: AppColors.primaryColors,
                            // ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: AppColors.primaryColors,
                                ))
                          ])
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BaseContainerWidget(
                borderRadius: BorderRadius.circular(0),
                containerColor: Colors.black54,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Text(anime.titleEnglish ?? anime.title ?? "None",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
