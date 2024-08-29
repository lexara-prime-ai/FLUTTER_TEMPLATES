import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void printListContent(List list) {
  for (var i = 0; i < list.length; i++) {
    print(list[i]);
  }
}

void main() {
  // Defining variables.
  String name = "John Doe";
  int age = 26;
  double pi = 3.14;
  bool isTemplate = true;

  List nums = [1, 2, 3, 4, 5];

  if (kDebugMode) {
    printListContent(nums);
  }

  /*
  
    MATH OPERATORS.
    +, -, *, /, %
  
    COMPARISON OPERATORS
    1 == 1 -> true, EQUAL TO
    2 != 3 -> true, NOT EQUAL TO
    3 < 2 -> false
    1 <= 3 -> true
    3 >= 1 -> true

    LOGICAL OPERATORS
    The AND operator returns true if both sides are true.
    isTemplate && ( age < 18 ) return false;

    The OR operator returns true if atleast one side is true.
    isTemplate || ( age < 18 ) -> return true;

    The NOT operator returns the opposite value.
    !isTemplate -> false;

    List -> Array
    Set -> An array of unique values.
    Map -> Key value pairs e.g HashMap, Dict.
  */

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
