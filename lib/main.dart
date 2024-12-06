import 'package:flutter/material.dart';
import 'package:todo_app/config/media_query.dart';
import 'package:todo_app/controller/category_controller.dart';
import 'package:todo_app/controller/tasks_controller.dart';
import 'package:todo_app/view/add_task.dart';
import 'package:todo_app/view/home.dart';
import 'package:provider/provider.dart';
void main(){

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context)=>CategoryController()),
        ChangeNotifierProvider(create: (context)=>TasksController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff263381),
          primaryColorLight: Color(0xffff4e00),
          scaffoldBackgroundColor: Colors.white70
        ),
        routes: {
          '/':(context)=>HomePage(),
          '/addTask':(context)=>AddTask(),
        },
      ),
    );
  }
}
