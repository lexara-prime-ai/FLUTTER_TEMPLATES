import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_drive/pages/home_page.dart';

void main() async {
  /* Initialize hive. */
  await Hive.initFlutter();

  /* Open box (storage). */
  var box = await Hive.openBox('td_box');

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.grey),
    );
  }
}
