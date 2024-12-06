// import 'dart:convert';
//
// import 'package:tasks_todo/model/tasks.dart';
// import 'package:http/http.dart' as http;
// import '../config/constants.dart';
//
// Future<List<Tasks>> fetchTasks() async {
//   final response = await http.get(Uri.parse('$baseUrl/fetch_tasks.php'));
//
//   if (response.statusCode == 200) {
//     final List data = json.decode(response.body)['tasks'];
//     return data.map((task) => Tasks.fromJson(task)).toList();
//   } else {
//     throw Exception('Failed to fetch tasks');
//   }
// }
//
// Future<bool> addTask(Tasks task) async {
//   final response = await http.post(
//     Uri.parse('$baseUrl/add_task.php'),
//     headers: {"Content-Type": "application/json"},
//     body: json.encode(task.toJson()),
//   );
//
//   return response.statusCode == 200;
// }
//
// Future<bool> updateTask(Tasks task) async {
//   final response = await http.put(
//     Uri.parse('$baseUrl/update_task.php'),
//     headers: {"Content-Type": "application/json"},
//     body: json.encode(task.toJson()),
//   );
//
//   return response.statusCode == 200;
// }