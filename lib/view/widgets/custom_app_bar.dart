import 'package:flutter/material.dart';
import 'package:todo_app/config/constants.dart';
import 'package:todo_app/config/media_query.dart';
import 'package:todo_app/controller/category_controller.dart';
import 'package:todo_app/model/task_categories.dart';
import 'package:provider/provider.dart';
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
   CustomAppBar({super.key});
   Size get preferredSize => Size.fromHeight(height/4.6);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int selected=0;

  @override
  Widget build(BuildContext context) {
    List<TaskCategory> categories=context.watch<CategoryController>().categories;
    return SafeArea(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Theme.of(context).primaryColorLight,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            Text("Good Morning",style: TextStyle(color: Theme.of(context).primaryColorLight,fontSize: 18,letterSpacing: 0),),
                            Text("ArmaanDesign",style: TextStyle(color: Colors.white,fontSize: 18,letterSpacing: 0),)
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.search,size: 30,color: Colors.white,),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white)
                        ),
                      ),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/posts');
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.notification_add_outlined,size: 30,color: Colors.white,),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white)
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),),
            SizedBox(height: 30,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(categories.length, (int index){
                    return  GestureDetector(
                      onTap: (){
                        setState(() {
                          selected=index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          children: [
                            Container(
                              child: Icon(categories[index].icon,color: selected==index?Theme.of(context).primaryColor:Colors.white,size: height/23,),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).primaryColorLight
                              ),
                              height: height/17,
                              width: height/17,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Text(categories[index].text,style: kNormalTextFormat.copyWith(color: Colors.white),),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),)
          ],

        ),

      ),
    );
  }

}
