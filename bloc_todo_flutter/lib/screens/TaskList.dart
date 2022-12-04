import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/tasks_bloc.dart';
import '../models/task.dart';


class ListTasks extends StatelessWidget {
  const ListTasks({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context,index){
          var task = taskList[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              onChanged: (value) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              }, 
              value: task.isDone,
              ),
              onLongPress: () => context.read<TasksBloc>().add(DeleteTask(task: task)),
          );
        }
        ),
    );
  }
}