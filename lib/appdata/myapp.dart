import 'package:flutter/material.dart';
import 'package:midlandfinal/screens/admission.dart';
import 'package:midlandfinal/screens/homeScreen.dart';
import 'package:midlandfinal/screens/login.dart';
import 'package:midlandfinal/screens/homescreen2.dart';
import 'package:midlandfinal/screens/initial.dart';
import 'package:midlandfinal/screens/navigationButton.dart';
import 'package:midlandfinal/screens/userbookings.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   brightness: Brightness.dark,
      //   scaffoldBackgroundColor: Colors.white,//Color(0xffF7BC45),
      // ),
      title: 'Material App',
      initialRoute: UserBookings.id,
      routes: {
        Login.id : (context) => Login(),
        HomeScreen.id : (context) => HomeScreen(),
        Home.id : (context) => Home(),
        Init.id : (context) => Init(),
        Admission.id : (context) => Admission(),
        Cart.id : (context) => Cart(),
        UserBookings.id : (context) => UserBookings(),
      },
    );
  }
}