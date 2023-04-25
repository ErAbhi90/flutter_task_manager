import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/app_strings.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likeOrDislikeCallback;
  final VoidCallback editTaskCallback;
  final VoidCallback restoreTaskCallback;

  const PopupMenu({
    Key? key,
    required this.task,
    required this.cancelOrDeleteCallback,
    required this.likeOrDislikeCallback,
    required this.editTaskCallback,
    required this.restoreTaskCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? ((context) => [
                PopupMenuItem(
                  onTap: null,
                  child: TextButton.icon(
                    onPressed: editTaskCallback,
                    icon: const Icon(Icons.edit),
                    label: const Text(AppStrings.edit),
                  ),
                ),
                PopupMenuItem(
                  onTap: likeOrDislikeCallback,
                  child: TextButton.icon(
                    onPressed: null,
                    icon: task.isFavorite == false
                        ? const Icon(Icons.bookmark_add_outlined)
                        : const Icon(Icons.bookmark_remove),
                    label: task.isFavorite == false
                        ? const Text(AppStrings.addToBookmarks)
                        : const Text(AppStrings.removeBookmarks),
                  ),
                ),
                PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete),
                      label: const Text(AppStrings.delete),
                    )),
              ])
          : (context) => [
                PopupMenuItem(
                    onTap: restoreTaskCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.restore_from_trash),
                      label: const Text(AppStrings.restore),
                    )),
                PopupMenuItem(
                    onTap: cancelOrDeleteCallback,
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.delete_forever),
                      label: const Text(AppStrings.deleteForever),
                    )),
              ],
    );
  }
}
