import 'package:flutter/material.dart';
import 'package:myfirstapp/settings/colors.dart';
import 'package:myfirstapp/t1.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text("P1"),
            ElevatedButton(
                onPressed: () {
// Navigator.pushAndRemoveUntil(context, newRoute, (route) => false)
//             Navigator.push(context, MaterialPageRoute(builder: (_)=>Notes()));

                  Navigator.pushAndRemoveUntil(
                      context, MaterialPageRoute(builder: (_) => Test1()),(route) => false);
                },
                child: Text('دخول',
                    style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}
