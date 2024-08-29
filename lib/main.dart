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
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: 200,
                color: Colors.amber,
              ),
            ),
            Expanded(
              child: Container(
                height: 200,
                color: Colors.amber[200],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.amber[100],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
