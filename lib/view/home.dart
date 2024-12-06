import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/controller/category_controller.dart';
import 'package:todo_app/controller/tasks_controller.dart';
import 'package:todo_app/model/tasks.dart';
import 'package:todo_app/view/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';
import 'add_task.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  @override
  @override

  @override
  Widget build(BuildContext context) {
    context.read<TasksController>().getTasks();
    List<Tasks> _task=context.watch<TasksController>().tasks;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white70,
        ),
        child: Stack(

          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: HorizontalWeekCalendar(
                        onDateChange: (date) {
                          setState(() {
                            selectedDate = date;
                          });
                        },
                        minDate: DateTime(2000, 01, 01),
                        maxDate: DateTime(2100, 01, 01),
                        initialDate: selectedDate),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "All Tasks",
                        style: kNormalTextFormat.copyWith(
                            color: Theme.of(context).primaryColorLight, fontSize: 20),
                      ),
                    ),
                  ),
                  Column(
                    children: List.generate(context.watch<TasksController>().tasks.length, (int index){
                      return Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(_task[index].title,style: kNormalTextFormat.copyWith(color: Theme.of(context).primaryColor),),
                                    Text(DateFormat('yyyy-MM-DD hh:mm a').format(_task[index].date))
                                  ],
                                ),
                                Text(_task[index].note),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColorLight,
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 1),
                                          child: Row(
                                            children: [
                                              Icon(Icons.check_circle,color: Colors.white,),
                                              Text("Complated",style: kNormalTextFormat.copyWith(color: Colors.white),)
                                            ],
                                          ),),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                          onTap: (){

                                          },
                                              child: Icon(Icons.edit)),
                                          GestureDetector(
                                            onTap: (){
                                              context.read<TasksController>().deleteTask(_task[index].id);
                                            },
                                              child: Icon(Icons.delete))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),),

                          decoration: BoxDecoration(
                              border: Border.all(width: 0.5,color: Theme.of(context).primaryColor),
                              borderRadius: BorderRadius.circular(20)
                          ),
                        ),);
                    }),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        useSafeArea: true,
                        showDragHandle: true,
                        isScrollControlled: true,
                          context: context, builder: (BuildContext context){
                        return AddTask();
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
                      radius: 37,
                      child: CircleAvatar(
                        child: Icon(Icons.add,color: Colors.white,),
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 30,
                      ),
                    ),
                  ),
                ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.transparent,
                  Theme.of(context).primaryColor
                ])
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
