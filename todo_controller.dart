import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todo_model.dart';

class TodoController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    fetchTodos();
    super.onInit();
  }

  // Fetch todos from Firestore
  void fetchTodos() async {
    final snapshot = await _firestore.collection('todossss').get();
    todos.assignAll(
        snapshot.docs.map((doc) => Todo.fromJson(doc.data())).toList());
  }

  // Add a new todo
  void addTodo(String title) async {
    final todo = Todo(id: DateTime.now().toString(), title: title);
    await _firestore.collection('todossss').doc(todo.id).set(todo.toJson());
    fetchTodos(); // Refresh the list
  }

  // Update a todo
  void updateTodo(Todo todo) async {
    await _firestore.collection('todossss').doc(todo.id).update(todo.toJson());
    fetchTodos(); // Refresh the list
  }

  // Delete a todo
  void deleteTodo(String id) async {
    await _firestore.collection('todossss').doc(id).delete();
    fetchTodos(); // Refresh the list
  }
}
