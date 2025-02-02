import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zoom_clone/core/services/auth_services.dart';
import 'package:zoom_clone/core/theme_data/colors.dart';
import 'package:zoom_clone/feature/homePage/view/widgets/meeting_option_widget.dart';

class VideoCallPage extends HookWidget {
  const VideoCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Controllers
    final AuthServices authServices = AuthServices();
    final TextEditingController meetinIdController = useTextEditingController();
    final TextEditingController nameController =
        useTextEditingController(text: authServices.user.displayName ?? 'user');

    //states
    final onAudioMute = useState<bool>(true);
    final onVideoMute = useState<bool>(true);

    ///Function
    ///onAudioMute

    isAudioMuted(bool val) {
      onAudioMute.value = val;
    }

    ///onVideoMute
    isVideoMuted(bool val) {
      onVideoMute.value = val;
    }

    ///Join Meeting
    joinMeeting() {}

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorPalette.backgroundColor,
        title: const Text(
          "Join Meeting",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetinIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: ColorPalette.secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Meeting ID',
                contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: ColorPalette.secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: 'Name',
                contentPadding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: joinMeeting,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Join",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MeetingOptionWidget(
            text: "Mute Audio",
            isMute: onAudioMute.value,
            onChanged: isAudioMuted,
          ),
          MeetingOptionWidget(
            text: "Mute Video",
            isMute: onVideoMute.value,
            onChanged: isVideoMuted,
          ),
        ],
      ),
    );
  }
}
