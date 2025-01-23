import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final darkTheme = ThemeData(
  appBarTheme: _appBarTheme,
  scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryColors,
    brightness: Brightness.dark,
  ),
  primaryColor: AppColors.primaryColors,
  useMaterial3: true,
  textTheme: _textTheme.copyWith(
    headlineLarge: TextStyle(color: AppColors.textColorsDark),
    titleMedium: TextStyle(color: AppColors.textColorsDark),
    headlineSmall: TextStyle(color: AppColors.textColorsDark),
    titleLarge: TextStyle(color: AppColors.textColorsDark),
    titleSmall: TextStyle(color: AppColors.textColorsDark),
    bodyLarge: TextStyle(color: AppColors.textColorsDark),
    bodyMedium: TextStyle(color: AppColors.textColorsDark),
    bodySmall: TextStyle(color: AppColors.textColorsDark),
    labelLarge: TextStyle(color: AppColors.textColorsDark),
    labelMedium: TextStyle(color: AppColors.textColorsDark),
    labelSmall: TextStyle(color: AppColors.textColorsDark),
  ),
);

const _textTheme = TextTheme(
  headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
  headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
  headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
  titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
  bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
  bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
  labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
  labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
  labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
);

const _appBarTheme = AppBarTheme(
  backgroundColor: Colors.transparent,
  elevation: 0,
  centerTitle: true,
  surfaceTintColor: Colors.transparent,
);

extension ThemePlatformExtension on ThemeData {
  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  bool get isCupertino => [TargetPlatform.iOS, TargetPlatform.macOS]
      .contains(defaultTargetPlatform);
  Color get cupertinoAlertColor => const Color(0xFFF82B10);
  Color get cupertinoActionColor => const Color(0xFF3478F7);

  IconData get visibilityOutlined =>
      isAndroid ? Icons.visibility_outlined : CupertinoIcons.eye;
  IconData get visibilityOffOutlined =>
      isAndroid ? Icons.visibility_off_outlined : CupertinoIcons.eye_slash;
}
