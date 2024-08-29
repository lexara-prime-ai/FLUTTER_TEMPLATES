import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Music"),
          backgroundColor: Colors.amber[200],
          elevation: 0,
          leading: const Icon(Icons.menu_open),
          actions: const [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.logout,
                  color: Colors.black87,
                ))
          ],
        ),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 400,
              color: Colors.amber,
            ),
            Container(
              width: 200,
              color: Colors.amber[200],
            ),
            Container(
              width: 300,
              color: Colors.amber[100],
            ),
          ],
        ),
      ),
    );
  }
}
