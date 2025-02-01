import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/core/theme_data/colors.dart';
import 'package:zoom_clone/feature/auth/view/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: ColorPalette.backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
