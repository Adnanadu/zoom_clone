import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoom_clone/core/services/auth_services.dart';

class JitsiMeetServices {
  final AuthServices _authServices = AuthServices();
  final JitsiMeet jitsiMeet = JitsiMeet();

  void createNewMeeting({
    required String roomName,
    bool? isAudioMuted,
    bool? isVideoMuted,
  }) async {
    jitsiMeet.join(
      JitsiMeetConferenceOptions(
        featureFlags: {
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
          'welcomepage.enabled': false,
        },
        room: roomName,
        configOverrides: {
          "startWithAudioMuted": isAudioMuted,
          "startWithVideoMuted": isVideoMuted,
          "subject": "Jitsi with Flutter",
        },
        serverURL: "https://meet.jit.si",
        userInfo: JitsiMeetUserInfo(
          avatar: _authServices.user.photoURL,
          displayName: _authServices.user.displayName,
          email: _authServices.user.email,
        ),
      ),
    );
  }
}
