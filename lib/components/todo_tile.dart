import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  /* Todo Tile constructor */
  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          )
        ]),
        child: Material(
          elevation: 3,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
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
                color: const Color.fromARGB(96, 79, 79, 79),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
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
                        const Color.fromARGB(124, 73, 73, 73)),
                    activeColor: Colors.greenAccent,
                    checkColor: Colors.greenAccent,
                    shape: const CircleBorder(),
                  ),
                ),

                /* Task name */
                Text(
                  taskName,
                  style: TextStyle(
                    decoration: TextDecoration.combine([
                      taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ]),
                    decorationThickness: 3,
                    decorationColor: Colors.grey[700],
                    color: Colors.grey[500],
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
