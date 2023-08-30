import 'package:todoapp/model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
  }

  void removeTask(Task task) {
    _tasks.remove(task);
  }

  void updateTask(Task task) {
    final index = _tasks.indexWhere((element) => element.id == task.id);
    _tasks[index] = task;
  }

  void toggleTask(Task task) {
    final index = _tasks.indexWhere((element) => element.id == task.id);
    _tasks[index].isDone = !task.isDone;
  }

  List<Task> getUndoneTasks() {
    return _tasks.where((element) => !element.isDone).toList();
  }
}
