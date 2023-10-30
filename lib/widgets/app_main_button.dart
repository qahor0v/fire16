import 'package:fire16/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppMainButton extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const AppMainButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
      color: mainColor,
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
