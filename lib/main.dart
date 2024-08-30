import 'package:flutter/material.dart';
import 'package:test_drive/pages/todo_page.dart';

void main() {}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(),
    );
  }
}
