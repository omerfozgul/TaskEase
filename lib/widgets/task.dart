import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/taskbox_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/provider/todo_provider.dart';
import 'package:flutter_todo/constants.dart';
import 'package:flutter_todo/widgets/task_tile.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  TextEditingController newTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TaskBoxAndButton(newTaskController: newTaskController),
          FutureBuilder(
            future: Provider.of<TodoProvider>(context, listen: false).getTodos,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Consumer<TodoProvider>(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        heightFactor: MediaQuery.of(context).size.height * 0.02,
                        child: const Text(
                          'You have no tasks.',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  builder: (context, todoProvider, child) {
                    if (todoProvider.items.isEmpty) {
                      return child as Widget;
                    } else {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            itemCount: todoProvider.items.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: TaskTile(
                                todoProvider: todoProvider,
                                index: index,
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
