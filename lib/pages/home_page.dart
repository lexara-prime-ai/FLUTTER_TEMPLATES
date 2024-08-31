import 'package:flutter/material.dart';
import 'package:test_drive/components/dialog_box.dart';
import 'package:test_drive/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /* User input controller */
  final _controller = TextEditingController();

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

  void saveNewTask() {
    setState(() {
      todoList.add({
        todoList.length + 1: {_controller.text: false}
      });

      _controller.clear();
      Navigator.of(context).pop();
    });
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
