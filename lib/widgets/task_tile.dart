import 'package:flutter/material.dart';
import 'package:flutter_todo/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatelessWidget {
  TodoProvider todoProvider;
  int index;

  TaskTile({required this.todoProvider, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.black12,
      leading: Checkbox(
        value: todoProvider.items[index].isExecuted,
        activeColor: Colors.purple,
        onChanged: (newValue) {
          Provider.of<TodoProvider>(context, listen: false)
              .doneTask(todoProvider.items[index].id);
        },
      ),
      title: Text(todoProvider.items[index].itemName),
      trailing: IconButton(
        icon: const Icon(Icons.delete, color: Colors.red),
        onPressed: () {
          Provider.of<TodoProvider>(context, listen: false)
              .deleteTodo(todoProvider.items[index].id);
        },
      ),
    );
  }
}
