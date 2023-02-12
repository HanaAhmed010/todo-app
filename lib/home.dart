import 'package:flutter/material.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/intro.png'),
            Text('تطبيق المهام',style: TextStyle(fontSize: 50),),
            Text('تطبيق المهام'),
          ],
        ),
      ),
    );
  }
}
