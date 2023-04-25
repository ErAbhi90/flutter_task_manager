import 'package:flutter/material.dart';

import '../services/app_strings.dart';
import 'add_task_screen.dart';
import 'completed_tasks_screen.dart';
import 'favorite_tasks_screen.dart';
import 'my_drawer.dart';
import 'pending_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);
  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTasksScreen(), 'title': AppStrings.pendingTasks},
    {'pageName': const CompletedTasksScreen(), 'title': AppStrings.completedTasks},
    {'pageName': const FavoriteTasksScreen(), 'title': AppStrings.favouriteTasks},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton.extended(
              onPressed: () => _addTask(context),
              tooltip: AppStrings.addTask,
              label: const Text(AppStrings.addTask),
              icon: const Icon(Icons.add),
              
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.incomplete_circle_sharp), label: AppStrings.pendingTasks),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: AppStrings.completedTasks),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: AppStrings.favouriteTasks),
        ],
      ),
    );
  }
}
