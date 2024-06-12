import 'package:flutter/material.dart';
import 'package:nosso_primeiro_app/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<Task> taskList = [
    Task('Aprender Flutter', 'assets/images/flutter.png', 3),
    Task('Andar de Bike', 'assets/images/bike.png', 2),
    Task('Meditar', 'assets/images/meditation.jpeg', 5),
    Task('Ler', 'assets/images/read.jpg', 4),
    Task('Jogar', 'assets/images/play.jpg', 1),
  ];

  void addTask(
    String name,
    String image,
    int difficult,
  ) {
    taskList.add(Task(name, image, difficult));
  }

  int totalLevel() {
    int total = 0;
    for (final Task task in taskList) {
      total += task.level * task.difficult;
    }
    return total;
  }
  
  static TaskInherited? of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
