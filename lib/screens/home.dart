import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/Controller/homecontroller.dart';
import 'package:get/get.dart';
import '../model/todo.dart'; //تعريف المتغيرات
import '../constants/colors.dart'; //colors
import '../widgets/todo_item.dart'; //تصميم التاسكات

class Home extends StatelessWidget {
  Home({super.key});
  final homeController controller = Get.put(homeController());

  @override
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: tdBGColor,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 200,
                            bottom: 30,
                          ),
                          child: Text(
                            'saglny',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        for (ToDo todoo in controller.todosList.reversed)
                          ToDoItem(
                            todo: todoo,
                            onToDoChanged: controller.handleToDoChange,
                            onDeleteItem: controller.deleteToDoItem,
                          ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              child: Row(children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        right: 20, left: 25, top: 120, bottom: 99),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 96, 98, 105),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                          hintText: 'Add a new todo item',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 21, bottom: 0.0, right: 10),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      print("gg");
                      controller.addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      );
    });
  }
}
