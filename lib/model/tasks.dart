import 'dart:io';
class Tasks{
  final String title;
  final String category;
  final String note;
  final DateTime date;
  final int id;
  Tasks({required this.title,required this.category,required this.note,required this.date,required this.id});
factory Tasks.fromJson(Map<String,dynamic> json){
  return Tasks(title: json['title'].toString(), category:json['category'].toString(), note: json['note'].toString(), date: DateTime.parse(json['date']), id:json['id'],);
}
  
  
  // factory Tasks.fromJson(Map<String,dynamic> json){
//   return Tasks(title: json['title'], category: json['category'], note: json['note'], date: DateTime.parse(json['date']),id: int.parse(json['id']));
//   }
//
  Map<String,dynamic> toJson(){
  return {
    'id':id,
    'title':title,
    'category':category,
    'note':note,
    'date':date.toString()
  };
  }
}