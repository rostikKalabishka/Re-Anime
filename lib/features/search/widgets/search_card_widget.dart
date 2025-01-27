import 'package:flutter/material.dart';
import 'package:re_anime_app/api/models/anime.dart';
import 'package:re_anime_app/ui/ui.dart';

class SearchCardWidget extends StatelessWidget {
  const SearchCardWidget({super.key, required this.anime});
  final AnimeEntity anime;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final animeScore = anime.score ?? 0;
    final Size _size = MediaQuery.of(context).size;
    return BaseContainerWidget(
      padding: EdgeInsets.all(0),
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  height: _size.height / 3,
                  width: _size.width / 1.9,
                  anime.images?.jpg?.imageUrl ?? '',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: BaseContainerWidget(
                  containerColor: Colors.black54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        anime.aired?.from != null
                            ? DateTime.parse(anime.aired!.from!).year.toString()
                            : 'None',
                        style: theme.textTheme.bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 48,
                            height: 48,
                            child: UserScore(
                              percent: animeScore,
                              fillColors: Colors.transparent,
                              lineColor: Colors.green,
                              freeColor: Colors.red,
                              lineWidth: 2,
                              child: Text(
                                animeScore.toStringAsFixed(1),
                                style: theme.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          anime.titleEnglish ?? anime.title ?? "None",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.favorite))
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    anime.synopsis ?? "",
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall,
                    maxLines: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
