import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/task_categories.dart';

class CategoryController with ChangeNotifier{
  List<TaskCategory> _categories=[
    TaskCategory(text: "All Task", icon: Icons.list_alt, selected: false),
    TaskCategory(text: "Work", icon: Icons.work, selected: false),
    TaskCategory(text: "Ideas", icon: Icons.sunny, selected: false),
    TaskCategory(text: "Favorate", icon: Icons.favorite_border, selected: false),
    TaskCategory(text: "Porsonal", icon: Icons.person, selected: false),
  ];

  List<TaskCategory> get categories=>_categories;
}