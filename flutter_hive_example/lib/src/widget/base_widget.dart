import 'package:flutter/material.dart';

class ToDoBase extends StatelessWidget {
  final String description;
  final bool finished;
  final VoidCallback onFinished;
  final VoidCallback onDelete;

  const ToDoBase(
      {Key? key,
      required this.description,
      this.finished = false,
      required this.onFinished,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => onFinished(),
          child: Container(
            width: 25.0,
            height: 25.0,
            decoration: BoxDecoration(
              color: finished ? Colors.green : Colors.red,
              border: Border.all(color: Colors.blueGrey),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Text(
          description,
          style: TextStyle(
            decoration:
                finished ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        IconButton(
          onPressed: () {
            onDelete();
          },
          icon: const Icon(Icons.delete),
        ),
      ],
    );
  }
}
