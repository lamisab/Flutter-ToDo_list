import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/todo.dart';

class homeController extends GetxController {
  String? id;
  String? todoText;
  bool? isDone;
  final todosList = ToDo.todoList();

  handleToDoChange(ToDo todo) {
    todo.isDone = !todo.isDone;
  }

  deleteToDoItem(String id) {
    todosList.removeWhere((item) => item.id == id);
    update();
  }

  addToDoItem(String toDo) {
    todosList.add(ToDo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      todoText: toDo,
    ));
    update();
  }
}
