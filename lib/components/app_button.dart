import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  AppButton({super.key, required this.text, required this.onPressed});

  final String text;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: CircleBorder(),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[900],
        ),
      ),
    );
  }
}
