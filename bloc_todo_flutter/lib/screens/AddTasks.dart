import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc/tasks_bloc.dart';
import '../models/task.dart';

class AddTasks extends StatelessWidget {
  const AddTasks({
    Key? key,
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return Column(
      children: [
        const Text(
          "Add Task",
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: taskController,
          decoration: const InputDecoration(
              label: Text("Title"), border: OutlineInputBorder()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: ()=>Navigator.pop(context), child: const Text("cancel")),
             ElevatedButton(onPressed: (){
          var task = Task(title: taskController.text);
          context.read<TasksBloc>().add(AddTask(task: task));
          Navigator.pop(context);
          
        }, child: const Text("Add"))
          ],
        ),
       
      ],
    );
  }
}