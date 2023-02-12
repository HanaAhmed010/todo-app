import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/settings/colors.dart';
import 'package:myfirstapp/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: ArabicThemeData.font(arabicFont: ArabicFont.iBMPlexSansArabic),
     package: ArabicThemeData.package,
      appBarTheme: const AppBarTheme( elevation: 0, color: Colors.white),
     colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: mainColor,
       onSecondary: mainColor,
       background: Colors.white
      )
      ),
      home: const Home(),
    );
  }
}


