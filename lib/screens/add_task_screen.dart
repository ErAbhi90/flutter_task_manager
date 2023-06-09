import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../services/app_strings.dart';
import '../services/guid_gen.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text(
          AppStrings.addTask,
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: TextField(
            autofocus: true,
            controller: titleController,
            decoration: const InputDecoration(
              label: Text(AppStrings.title),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        TextField(
          autofocus: true,
          controller: descriptionController,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
            label: Text(AppStrings.description),
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(AppStrings.cancel),
            ),
            ElevatedButton(
              onPressed: () {
                var task = Task(
                  title: titleController.text,
                  description: descriptionController.text,
                  id: GUIDGen.generate(),
                  date: DateTime.now().toString(),
                );
                context.read<TasksBloc>().add(AddTask(task: task));
                Navigator.pop(context);
              },
              child: const Text(AppStrings.add),
            ),
          ],
        ),
      ]),
    );
  }
}
