import 'package:flutter/material.dart';
import 'package:zoom_clone/core/theme_data/colors.dart';
import 'package:zoom_clone/feature/homePage/view/widgets/home_meeting_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.backgroundColor,
        elevation: 0,
        title: Text("Meet & Chat"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButtonWidget(
                onPressed: () {},
                text: "New Meeting",
                icon: Icons.videocam,
              ),
              HomeMeetingButtonWidget(
                onPressed: () {},
                text: "Join Meeting",
                icon: Icons.add_box_rounded,
              ),
              HomeMeetingButtonWidget(
                onPressed: () {},
                text: "Shedule",
                icon: Icons.calendar_today,
              ),
              HomeMeetingButtonWidget(
                onPressed: () {},
                text: "Share Screen",
                icon: Icons.arrow_upward_rounded,
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                "create/Join Meeting with just a click!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorPalette.footerColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          onTap: onPageChanged,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.comment_bank,
              ),
              label: 'Meet & Char',
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
          ]),
    );
  }
}
