import 'package:todoapp/model/task_list.dart';

class TaskListRepository {
  final List<TaskList> _taskLists = [];

  List<TaskList> get taskLists => _taskLists;

  void addTaskList(TaskList taskList) {
    _taskLists.add(taskList);
  }

  void removeTaskList(TaskList taskList) {
    _taskLists.remove(taskList);
  }

  void updateTaskList(TaskList taskList) {
    final index = _taskLists.indexWhere((element) => element.id == taskList.id);
    _taskLists[index] = taskList;
  }

  void toggleTaskList(TaskList taskList) {
    final index = _taskLists.indexWhere((element) => element.id == taskList.id);
    _taskLists[index].isDone = !taskList.isDone;
  }

  List<TaskList> getUndoneTaskLists() {
    return _taskLists.where((element) => !element.isDone).toList();
  }

  List<TaskList> getFavoriteTaskLists() {
    return _taskLists.where((element) => element.isFavorite).toList();
  }

  List<TaskList> getUndoneFavoriteTaskLists() {
    return _taskLists
        .where((element) => !element.isDone && element.isFavorite)
        .toList();
  }

  List<TaskList> getDoneTaskLists() {
    return _taskLists.where((element) => element.isDone).toList();
  }

  List<TaskList> getDoneFavoriteTaskLists() {
    return _taskLists
        .where((element) => element.isDone && element.isFavorite)
        .toList();
  }
}
