import 'package:flutter/material.dart';
import 'package:zoom_clone/core/theme_data/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BottomNavigationBar(type: BottomNavigationBarType.fixed, items: [
        BottomNavigationBarItem(
            backgroundColor: ColorPalette.footerColor,
            icon: Icon(Icons.comment_bank),
            label: 'Meet & Chat'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Contacts'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined), label: 'Settings'),
      ]),
    );
  }
}
