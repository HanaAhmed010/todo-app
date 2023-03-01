import 'package:flutter/material.dart';
import 'package:myfirstapp/settings/colors.dart';
import 'package:myfirstapp/settings/keys.dart';
import 'package:myfirstapp/t1.dart';


class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  List<Map<String,dynamic>> todo=[
    {
      'title':"Clean my car",
      'done':false,
      'id':"asd122",
      'date':"12/12/2023"
    
    },
    {
      'title':"Clean my car22222",
      'done':false,
      'id':"asd122",
      'date':"12/12/2023"

    },
    {
      'title':"Clean my car3333",
      'done':false,
      'id':"asd122",
      'date':"12/12/2023"

    }
  ];
  bool v=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {  },
      // child:Icon(Icons.add,color: textColor,size: 30,) ,),
      appBar: AppBar(
        title: Text("المهام", style: TextStyle(fontSize: 20,color: textColor,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add,color: textColor,size: 30,))
        ],
        
      ),

    body:Container(
    width: Sizee.width(context),
      height: Sizee.height(context),
      child: ListView.builder(
        itemCount: todo.length,
        
        itemBuilder: (BuildContext context, int index) { 
       
          return GestureDetector(
            onTap: (){
              setState(() {
                todo[index]['done']=!todo[index]['done'];
              });
              // print(" hehehehehe");
            },
            child: Container(
              width: Sizee.width(context),
              height: 100,
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 15),
              padding:EdgeInsets.symmetric(horizontal: 20) ,
              child: Stack(
                children: [
                  Container(
                    width: Sizee.width(context),
height: Sizee.height(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor:mainColor ,
                                value:  todo[index]['done'] , 
                                
                                onChanged: (value){
                         setState(() {
                           v=!value!;
                         }); },
                              
                              
                              
                            ),
                            Text(todo[index]['title'],style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        
                        Container(
                          width: Sizee.width(context),
                          alignment: Alignment.centerRight,
                          child: Text(todo[index]['date'],style: TextStyle(fontSize: 10,color: Colors.grey),),
                        )
                        
                      ],
                    ),
                  ),
                  
                  AnimatedPositioned(
                    left: todo[index]['done']==false?Sizee.width(context):0,
                    right: todo[index]['done']==false?Sizee.width(context):0,
                    top: 40,
                  
                      child: Container(
                        height: 7,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ), 
                      duration: Duration(
                        seconds: 1
                      ))
                ],
              ),
              // padding: EdgeInsets.all(value),
            ),
          );
          
        },
      
      ),
    ),
    );
  }
}
