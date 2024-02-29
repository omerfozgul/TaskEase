import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/provider/todo_provider.dart';
import 'package:flutter_todo/constants.dart';

class TaskBoxAndButton extends StatelessWidget {
  const TaskBoxAndButton({
    super.key,
    required this.newTaskController,
  });

  final TextEditingController newTaskController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: newTaskController,
            decoration: InputDecoration(
              labelText: 'New Task',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: kAddButtonStyle,
          child: const Text(
            "Add",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Provider.of<TodoProvider>(context, listen: false)
                .addTodo(newTaskController.text);
            newTaskController.clear();
          },
        ),
      ],
    );
  }
}
