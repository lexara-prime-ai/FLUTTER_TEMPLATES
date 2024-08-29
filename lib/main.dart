import 'package:flutter/material.dart';
import 'package:test_drive/pages/first_page.dart';
import 'package:test_drive/pages/home_page.dart';
import 'package:test_drive/pages/settings_page.dart';

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
      routes: {
        '/firstpage': (context) => FirstPage(),
        '/homepage': (context) => HomePage(),
        '/settingspage': (context) => SettingsPage()
      },
    );
  }
}
