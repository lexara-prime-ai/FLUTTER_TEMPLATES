import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    // Rebuilds the widget and updates the state.
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You pushed the button this many times:"),
            Text(
              _counter.toString(),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Icon(
                Icons.add,
                semanticLabel: 'Increment',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
