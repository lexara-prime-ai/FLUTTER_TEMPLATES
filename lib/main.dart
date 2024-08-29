import 'package:flutter/material.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contacts"),
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
        body: GridView.builder(
          itemCount: 64,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
          itemBuilder: (context, index) => Container(
            color: Colors.amber[200],
            margin: EdgeInsets.all(2),
          ),
        ),
      ),
    );
  }
}
