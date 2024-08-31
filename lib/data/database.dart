import 'package:hive_flutter/hive_flutter.dart';

/* Test data.

  List todoList = [
    {
      1: {'Built food app': false}
    },
    {
      2: {"Create figma designs": false}
    },
    {
      3: {"Review business plan": false}
    }
  ];

  */

class TodoDatabase {
  List todoList = [];
  /* Reference Hive box. */
  final _hiveBox = Hive.box('td_box');

  /* Meant to run the first time the app is opened. */
  void createInitialData() {
    todoList = [
      {
        1: {'Do laundry': false}
      },
      {
        2: {"Make dinner": false}
      },
      {
        3: {"Finish homework": false}
      }
    ];
  }

  /* Load data from database. */
  void loadData() {
    todoList = _hiveBox.get('TODOLIST');
  }

  /* Update database. */
  void updateDatabase() {
    _hiveBox.put("TODOLIST", todoList);
  }
}
