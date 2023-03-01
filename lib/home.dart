import 'package:flutter/material.dart';
import 'package:jelly_anim/jelly_anim.dart';
import 'package:myfirstapp/notes.dart';
import 'package:myfirstapp/settings/colors.dart';
import 'package:myfirstapp/settings/keys.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: Sizee.width(context),
        height: Sizee.height(context),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Sizee.width(context),

              height: Sizee.height(context) * 0.5,
              child:   Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom:8,
                    child: JellyAnim(
                      
                      radius: 200,
                      viewPortSize: Size(400, 400),
                      jellyCoordinates: 10,
                      colors: [
                        textColor.withOpacity(0.5),
                     
                      ],
                      duration: Duration(milliseconds: 1),
                      jellyPosition: JellyPosition.center,
                    ) ,),
                  
                  
                  Image.asset('assets/intro.png',width: 300, height: 300,)
                ],
              ),
            ),

             Text('تطبيق المهام',style: TextStyle(fontSize: 30,color: textColor,fontWeight: FontWeight.bold),),
const SizedBox(height:20 ,),
             Text('اهلا بك في تطبيق المهام' ,style: TextStyle(fontSize: 20,color: textColor,),),
            const SizedBox(height:20 ,),
          SizedBox(
            width: Sizee.width(context)*0.6,
            height: 45,
            
            child:   ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)
                )),
            
              ),

                onPressed: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>Notes()));
               
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Notes()));
               
            
               // Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
               
               
               
               
                },
                child: Text(
                    'دخول',
                    style: TextStyle(fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:textColor))),
          )
          ],
        ),
      ),
    );
  }
}
