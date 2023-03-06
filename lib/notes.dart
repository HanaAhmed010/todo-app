import 'package:date_format/date_format.dart';
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
  TextEditingController todoText=TextEditingController();
  List<Map<String,dynamic>> todo=[];
 
  bool v=true;
  

  create()async{
    final id =db.collection("toods").doc().id;
    await db.collection('todos').doc(id).set({
      'id':id,
      'title':todoText.text,
      'done':false,
      'date':formatDate(DateTime.now(), [yyyy,'/' , mm,'/',dd, " - ", h,':',nn,':',ss,"  ", am])
    });
    todoText.clear();

    Navigator.pop(context);
    
  }
  
  getTodo() async{
    db.collection('todos').stream.listen((event) { 
     setState(() {
       todo.add(event);
       todo.sort((a,b)=>(a['date']).compareTo(b['date']));
     });
    });
    print(todo);
  }
  
  delete(id) async{
   await db.collection('todos').doc(id).delete().then((value) => {
     print(id),

      todo.removeWhere((element) => element['id']==id)
    });
    
  }
  
  update(id,title,done,date) async{
    await db.collection('todos').doc(id).set({
      'id':id,
      'title':title,
      'done':done,
      'date':date
      
    }).then((value) => {
     
      todo.removeWhere((element) => element['id']==id)
    });
    
  }
  @override
  void initState() {

    getTodo();
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    print('2');
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {  },
      // child:Icon(Icons.add,color: textColor,size: 30,) ,),
      appBar: AppBar(
        title: Text(" المهام", style: TextStyle(fontSize: 20,color: textColor,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){
           print(DateTime.now());
            showModalBottomSheet(
              isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (_){
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: Sizee.height(context)*0.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft:  Radius.circular(10))
                    ),
                    
                    child: Column(
                      children: [
                        Text("اضافة مهام" ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                          margin: EdgeInsets.symmetric(vertical: 15),
                          width: Sizee.width(context)*0.9,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: TextField(
                            controller: todoText,
                            decoration: InputDecoration(
                              icon: Icon(Icons.edit),
                              border: InputBorder.none
                            ),
                            
                            
                          ),
                          
                          
                        ),
                        
                        SizedBox(
                          width: Sizee.width(context)*0.9,
                          height: 40,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              )),
                            ),
                            onPressed: () {
                              create();
                              
                            },
                          child: Text("اضافة"),),
                        )
                      ],
                    ),
                  );
                }
            
            
            );
            
            
          }, icon: Icon(Icons.add,color: textColor,size: 30,))
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
              
            },
          onLongPress: (){
            delete(todo[index]['id']);
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
                                  update(todo[index]['id'],todo[index]['title'],value,todo[index]['date']);
                         
                         },
                              
                              
                              
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
