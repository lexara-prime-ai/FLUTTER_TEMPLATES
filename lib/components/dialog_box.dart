import 'package:flutter/material.dart';
import 'package:test_drive/components/app_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  const DialogBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(219, 206, 206, 206),
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /**
             * Get user input.
             */
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Add a new task...",
                hintStyle: TextStyle(color: Colors.grey[700]),
              ),
            ),

            /**
             * Save + Cancel button.
             */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppButton(text: "Save", onPressed: () {}),
                const SizedBox(
                  width: 8,
                ),
                AppButton(text: "Cancel", onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
