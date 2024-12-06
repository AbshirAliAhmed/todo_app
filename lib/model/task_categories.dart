import 'package:flutter/cupertino.dart';

class TaskCategory{
  final String text;
  final IconData icon;
  final bool selected;
  TaskCategory( {required this.text, required this.icon,required this.selected});
}