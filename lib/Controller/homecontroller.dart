import 'package:get/get.dart';

import '../model/todo.dart';

class homeController extends GetxController {
  String? id;
  var todoText = ''.obs;
  bool? isDone;
  final todosList = ToDo.todoList().obs;
  // final _todoController = TextEditingController();

  handleToDoChange(ToDo todo) {
    todo.isDone = !todo.isDone;
    update();
  }

  deleteToDoItem(String id) {
    todosList.removeWhere((item) => item.id == id);
    update();
  }

  addToDoItem(String toDo) {
    print("for add");
    todosList.add(ToDo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      todoText: toDo,
    ));
    todoText.value = toDo;
    update();
  }
}
