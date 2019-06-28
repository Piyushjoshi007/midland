import 'package:flutter/material.dart';
import 'package:midlandfinal/screens/homeScreen.dart';
import 'package:midlandfinal/screens/login.dart';
import 'package:midlandfinal/screens/booking.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xffF7BC45),
      ),
      initialRoute: HomeScreen.id,
      routes: {
        Login.id : (context) => Login(),
        HomeScreen.id : (context) => HomeScreen(),
        Booking.id : (context) => Booking(),
      },
    );
  }
}