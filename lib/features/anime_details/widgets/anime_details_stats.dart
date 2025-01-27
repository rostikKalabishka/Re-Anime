import 'package:flutter/material.dart';
import 'package:re_anime_app/ui/ui.dart';

class AnimeDetailsStats extends StatelessWidget {
  const AnimeDetailsStats({
    super.key,
    required this.score,
    required this.viewers,
    required this.favorites,
    required this.rank,
  });

  final double score;

  final String viewers;
  final String favorites;
  final int rank;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: UserScore(
                percent: score,
                fillColors: Colors.transparent,
                lineColor: Colors.green,
                freeColor: Colors.red,
                lineWidth: 2,
                child: Text(
                  score.toStringAsFixed(1),
                  style: theme.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(
              'Rating',
              style: theme.textTheme.titleMedium,
            )
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.star_outline,
              color: theme.primaryColor,
            ),
            Text('#$rank', style: theme.textTheme.titleMedium),
            Text('Ranking', style: theme.textTheme.titleMedium)
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.monitor,
              color: theme.primaryColor,
            ),
            Text(
              viewers,
              style: theme.textTheme.titleMedium,
            ),
            Text('Viewers', style: theme.textTheme.titleMedium)
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.favorite,
              color: theme.primaryColor,
            ),
            Text(
              favorites,
              style: theme.textTheme.titleMedium,
            ),
            Text('Favorites', style: theme.textTheme.titleMedium)
          ],
        )
      ],
    );
  }
}
