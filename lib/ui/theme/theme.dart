import 'package:flutter/material.dart';

import 'app_colors.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColors,
    brightness: Brightness.dark,
  ),
  primaryColor: AppColors.primaryColors,
  useMaterial3: true,
  textTheme: _textTheme.copyWith(
      headlineLarge: TextStyle(color: AppColors.textColorsDarkTheme),
      titleMedium: TextStyle(color: AppColors.textColorsDarkTheme)),
);

const _textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  headlineLarge: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
  ),
);
