import 'dart:developer';

import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/core/services/auth_services.dart';
import 'package:zoom_clone/core/services/firestore_services.dart';

class JitsiMeetServices {
  final AuthServices authServices = AuthServices();
  final FirestoreServices firestoreServices = FirestoreServices();
  final JitsiMeet jitsiMeet = JitsiMeet();
  void createNewMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String userName = '',
  }) async {
    try {
      String name;
      if (userName.isEmpty) {
        name = authServices.user.displayName!;
      } else {
        name = userName;
      }
      var options = JitsiMeetConferenceOptions(
        room: roomName,
        featureFlags: {
          'FeatureFlags.resolution': FeatureFlagVideoResolutions.resolution720p,
          'welcomepage.enabled': false,
          'chat.enabled': false,
          'invite.enabled': false,
          'call-integration.enabled': false,
          'live-streaming.enabled': false,
          'meeting-name.enabled': false,
          'meeting-password.enabled': false,
          'pip.enabled': false,
          'raise-hand.enabled': false,
          'recording.enabled': false,
          'tile-view.enabled': false,
          'toolbox.alwaysVisible': false,
        },
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "subject": "Jitsi with Flutter",
        },
        serverURL: "https://meet.jit.si",
        userInfo: JitsiMeetUserInfo(
          avatar: authServices.user.photoURL,
          displayName: authServices.user.displayName,
          email: authServices.user.email,
        ),
      );
      firestoreServices.addToMeetingHistory(roomName);

      await jitsiMeet.join(options);
    } catch (e) {
      log(e.toString());
    }
  }
}
