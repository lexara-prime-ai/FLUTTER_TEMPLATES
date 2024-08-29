import 'package:flutter/material.dart';
import 'package:test_drive/pages/first_page.dart';
import 'package:test_drive/pages/second_page.dart';

void main() {
  runApp(const App());
}

List<String> getUsers() {
  return ["Johnny", "Potter", "Annie", "Walker", "Woistreshaur"];
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {'/secondpage': (context) => SecondPage()},
    );
  }
}
