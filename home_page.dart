import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';

class HomeScreen extends StatelessWidget {
  final TodoController _todoController = Get.put(TodoController());
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Enter a new todo',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      _todoController.addTodo(_textController.text);
                      _textController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: _todoController.todos.length,
                itemBuilder: (context, index) {
                  final todo = _todoController.todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    leading: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (value) {
                        todo.isCompleted = value!;
                        _todoController.updateTodo(todo);
                      },
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _todoController.deleteTodo(todo.id);
                      },
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
