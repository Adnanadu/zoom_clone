import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zoom_clone/core/theme_data/colors.dart';
import 'package:zoom_clone/feature/homePage/view/pages/history_meeting_page.dart';
import 'package:zoom_clone/feature/homePage/view/pages/meeting_page.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState<int>(0);

    final List<Widget> pages = [
      // HomePage(),
      MeetingPage(),
      HistoryMeetingPage(),
      Text("Contacts"),
      Text("Settings"),
    ];

    void onPageChanged(int pages) {
      currentIndex.value = pages;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.backgroundColor,
        elevation: 0,
        title: Text("Meet & Chat"),
        centerTitle: true,
      ),
      body: pages[currentIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorPalette.footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        onTap: onPageChanged,
        currentIndex: currentIndex.value,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: 'Meet & Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
