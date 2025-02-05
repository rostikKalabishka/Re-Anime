import 'package:flutter/material.dart';
import 'package:re_anime_app/ui/ui.dart';

class ReAnimeWidget extends StatelessWidget {
  const ReAnimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Re:",
          style: theme.textTheme.headlineLarge?.copyWith(
              color: AppColors.primaryColors,
              fontSize: 64,
              fontStyle: FontStyle.italic),
        ),
        Text("Anime",
            style: theme.textTheme.headlineLarge
                ?.copyWith(fontSize: 64, fontStyle: FontStyle.italic)),
      ],
    );
  }
}
