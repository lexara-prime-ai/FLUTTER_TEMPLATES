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
        backgroundColor: Colors.amber[100],
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
        body: Center(
          child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.amber[300],
                borderRadius: BorderRadius.circular(1000),
              ),
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
              child: const Icon(
                Icons.headphones,
                size: 72,
              )),
        ),
      ),
    );
  }
}
