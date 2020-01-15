import 'package:flutter/material.dart';
import 'package:my_resume/MenuDashboardPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),

      title: 'My Resume',

      home:MenuDashboardPage(),

    );
  }
}

