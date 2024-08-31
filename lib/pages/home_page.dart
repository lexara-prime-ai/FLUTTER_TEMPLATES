import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_drive/components/dialog_box.dart';
import 'package:test_drive/components/todo_tile.dart';
import 'package:test_drive/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* Reference Hive box. */
  final _hiveBox = Hive.box('td_box');

  /* User input controller. */
  final _controller = TextEditingController();
  TodoDatabase db = TodoDatabase();

/* Check initial state, when the app first runs. */
  @override
  void initState() {
    /* If this is the first ever, opening the app, the create default data */
    if (_hiveBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // Data is available.
      db.loadData();
    }

    super.initState();
  }

  /* On change method implementation: [checkboxToggled] */
  void checkboxToggled(bool? value, int index) {
    setState(() {
      // Access the map and update the task completion status.
      db.todoList[index].values.first
          .update(db.todoList[index].values.first.keys.first, (v) => value!);
    });

    db.updateDatabase();

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

  void saveNewTask() {
    setState(() {
      db.todoList.add({
        db.todoList.length + 1: {_controller.text: false}
      });

      _controller.clear();
    });

    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Row(children: [
          Icon(
            Icons.abc,
            color: Colors.grey[400],
          ),
          const SizedBox(width: 8),
          Text(
            "Pending items",
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w400,
                fontSize: 26,
                letterSpacing: 1.3),
          ),
        ]),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          /* Get task Map. */
          final taskMap = db.todoList[index].values.first;
          final taskName = taskMap.keys.first;
          final taskCompleted = taskMap.values.first;

          /* Return TodoTile widget */
          return TodoTile(
              taskName: taskName,
              taskCompleted: taskCompleted,
              deleteFunction: (context) => deleteTask(index),
              onChanged: (updatedValue) =>
                  checkboxToggled(updatedValue, index));
        },
      ),
    );
  }
}
