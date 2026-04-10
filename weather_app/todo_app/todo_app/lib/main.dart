import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}

class Todo {
  final int id;
  final String title;
  bool completed;

  Todo({required this.id, required this.title, required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Todo> todos = [];
  final TextEditingController controller = TextEditingController();

  final String baseUrl = "https://jsonplaceholder.typicode.com/todos";

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  // 📥 Lấy danh sách
  Future<void> fetchTodos() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);

      setState(() {
        todos = data.take(10).map((e) => Todo.fromJson(e)).toList();
      });
    }
  }

  // ➕ Thêm công việc
  Future<void> addTodo(String title) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      body: json.encode({
        "title": title,
        "completed": false,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);

      setState(() {
        todos.insert(0, Todo.fromJson(data));
        controller.clear();
      });
    }
  }

  // ✔️ Cập nhật trạng thái
  Future<void> toggleTodo(Todo todo) async {
    final response = await http.patch(
      Uri.parse("$baseUrl/${todo.id}"),
      body: json.encode({
        "completed": !todo.completed,
      }),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      setState(() {
        todo.completed = !todo.completed;
      });
    }
  }

  // ❌ Xóa
  Future<void> deleteTodo(int id) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/$id"),
    );

    if (response.statusCode == 200) {
      setState(() {
        todos.removeWhere((t) => t.id == id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ➕ Input thêm
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Nhập công việc...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      addTodo(controller.text);
                    }
                  },
                  child: const Text("Thêm"),
                )
              ],
            ),
          ),

          // 📋 Danh sách
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return ListTile(
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (_) => toggleTodo(todo),
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteTodo(todo.id),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}