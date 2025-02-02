import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/core/services/jitsi_meet_services.dart';
import 'package:zoom_clone/feature/homePage/view/widgets/home_meeting_button_widget.dart';

class MeetingPage extends StatelessWidget {
  MeetingPage({super.key});
  final JitsiMeetServices jitsiMeetServices = JitsiMeetServices();

  createNewMeeting() async {
    var random = Random();
    String roomName = "Flutter-${(random.nextInt(100000) + 100000).toString()}";
    jitsiMeetServices.createNewMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButtonWidget(
              onPressed: createNewMeeting,
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
    );
  }
}
