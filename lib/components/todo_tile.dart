import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  /* Todo Tile constructor */
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Material(
          elevation: 1.5,
          borderRadius: BorderRadius.circular(50),
          color: Colors.black38,
          child: Container(
            padding: const EdgeInsets.only(
              left: 36.0,
              right: 36.0,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              border: Border.all(
                width: 1,
                color: Colors.black38,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                /* Checkbox */
                Transform.scale(
                  scale: 1.3,
                  child: Checkbox(
                    value: taskCompleted,
                    onChanged: onChanged,
                    fillColor: WidgetStateProperty.all(
                        Color.fromARGB(125, 103, 103, 103)),
                    activeColor: Colors.greenAccent,
                    checkColor: Colors.greenAccent,
                    shape: const CircleBorder(),
                  ),
                ),

                /* Task name */
                Text(
                  taskName,
                  style: TextStyle(
                      color: Colors.grey[500],
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ));
  }
}
