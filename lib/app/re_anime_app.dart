import 'package:flutter/material.dart';
import 'package:re_anime_app/features/auth/login/view/login_screen.dart';
import 'package:re_anime_app/features/home/view/home_screen.dart';
import 'package:re_anime_app/ui/ui.dart';

import '../features/auth/registration/view.dart';

class ReAnimeApp extends StatelessWidget {
  const ReAnimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      home: RegistrationScreen(),
    );
  }
}
