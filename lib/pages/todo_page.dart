import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // Define text editing controller to get access to user input.
  TextEditingController inputController = TextEditingController();

  String message = "A message will be displayed here...";

  void greetUser() {
    setState(() {
      if (inputController.text.isEmpty) {
        message = "You did NOT provide a name...";
      } else {
        message = "Welcome, ${inputController.text}!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /* Display widget */
              Text(message),

              /* Input widget */
              TextField(
                controller: inputController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    hintText: "Type your name...",
                    hintStyle: TextStyle(color: Colors.grey[500])),
              ),
              ElevatedButton(
                onPressed: greetUser,
                child: Text("Tap me!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
