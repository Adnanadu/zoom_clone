import 'package:flutter/material.dart';
import 'package:zoom_clone/core/theme_data/colors.dart';

class HomeMeetingButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButtonWidget(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorPalette.buttonColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(1),
                  blurRadius: 10,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
            ),
            width: 60,
            height: 60,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
