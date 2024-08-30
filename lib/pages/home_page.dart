import 'package:flutter/material.dart';
import 'package:test_drive/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<int, Map<String, bool>>> todoList = [
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

  /* On change method implementation */
  void onChanged(bool? value, int index) {
    setState(() {
      // Access the map and update the task completion status.
      todoList[index]
          .values
          .first
          .update(todoList[index].values.first.keys.first, (v) => value!);
    });

    /**
     * 
     * Explanation:
      todoList[index].values.first gets the first value of the map 
      for the task (which is a nested map containing the task name 
      and its completion status).

      .update() method is used to change the completed status of the task. 
      It looks for the key (task name) and updates its value (completed) 
      to the new value from the checkbox.

      This way, you are specifically updating the completed status of 
      the task without affecting the rest of the map structure, 
      keeping your state management more efficient.
     */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "To do",
          style: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w400,
              letterSpacing: 1.3),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          /* Get task Map. */
          final taskMap = todoList[index].values.first;
          final taskName = taskMap.keys.first;
          final taskCompleted = taskMap.values.first;

          /* Return TodoTile widget */
          return TodoTile(
              taskName: taskName,
              taskCompleted: taskCompleted,
              onChanged: (updatedValue) => onChanged(updatedValue, index));
        },
      ),
    );
  }
}
