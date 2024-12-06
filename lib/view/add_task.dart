import 'package:flutter/material.dart';
import 'package:todo_app/config/media_query.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/controller/tasks_controller.dart';
class AddTask extends StatelessWidget {
  AddTask({super.key});
  final _formKey=GlobalKey<FormState>();
  TextEditingController _title=TextEditingController();
  TextEditingController _note=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child:TextFormField(
                controller: _title,
                validator: (text){
                  if(text!.isEmpty){
                    return "Title Field is required";
                  }
                },
                decoration: InputDecoration(
                  label: Text("Title"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 0.5
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColorLight,
                      width: 0.5
                    )
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )
                ),

              ),),
            SizedBox(height: 10,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child:TextFormField(
                controller: _note,
                validator: (text){
                  if(text!.isEmpty){
                    return "Note Field is required";
                  }
                },
                minLines: 6,
                maxLines: 10,
                decoration: InputDecoration(
                    label: Text("Note"),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 0.5
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).primaryColorLight,
                            width: 0.5
                        )
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    )
                ),

              ),),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: (){
                if(_formKey.currentState!.validate()){
                  Navigator.pop(context);
                  context.read<TasksController>().insertTask({'title':_title.text,'note':_note.text,'category':'work'});
                }

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text("Save",style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              ),
            ),)
          ],
        ),
      ),
      height: height-(height/4.6),
      color: Colors.white12,
    );
  }
}
