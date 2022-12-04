
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/tasks_bloc.dart';
import '../models/task.dart';
import 'AddTasks.dart';
import 'TaskList.dart';

class TasksScreen extends StatefulWidget {
  TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddTasks(),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksBloc, TasksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        //getting all list of tasks
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text("Task App"),
            actions: [
              IconButton(onPressed: () => _addTask(context), icon: const Icon(Icons.add))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(label: Text("Tasks:")),
              ),
              ListTasks(taskList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}


