import 'package:flutter/material.dart';
import 'package:midlandfinal/screens/homeScreen.dart';
import 'package:midlandfinal/screens/login.dart';
import 'package:midlandfinal/screens/homescreen2.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xffF7BC45),
      ),
      title: 'Material App',
      initialRoute: Home.id,
      routes: {
        Login.id : (context) => Login(),
        HomeScreen.id : (context) => HomeScreen(),
        Home.id : (context) => Home(),
      },
    );
  }
}