import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zoom_clone/core/services/auth_services.dart';
import 'package:zoom_clone/core/theme_data/colors.dart';

class VideoCallPage extends HookWidget {
  const VideoCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthServices authServices = AuthServices();
    final TextEditingController meetinIdController = useTextEditingController();
    final TextEditingController nameController =
        useTextEditingController(text: authServices.user.displayName ?? 'user');
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
            height: 16,
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
            height: 16,
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
        ],
      ),
    );
  }
}
