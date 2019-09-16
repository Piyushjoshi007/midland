import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:midlandfinal/Login_Options/email-pass-login/auth.dart';
import 'package:midlandfinal/screens/admission.dart';
import 'package:midlandfinal/screens/homeScreen.dart';
import 'package:midlandfinal/screens/login.dart';
import 'package:midlandfinal/screens/homescreen2.dart';
import 'package:midlandfinal/screens/initial.dart';
import 'package:midlandfinal/screens/navigationButton.dart';
import 'package:midlandfinal/screens/userbookings.dart';
import 'package:midlandfinal/Login_Options/email-pass-login/auth-screen.dart';
import 'package:provider/provider.dart';
import 'package:midlandfinal/screens/forms.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;


 
void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget homeee = AuthScreen();


  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
    
  }

  @override
  void initState() {
    super.initState();
    getUser().then((user) {
      if (user != null) {
        setState(() {
             homeee = Home();
        });
      }else{
        setState(() {
                  homeee = AuthScreen();

        });
      }
    });
  }
  

  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        )
      ],
      
      
      child:  MaterialApp(
      title: 'Material App',
      home: homeee,
      routes: {
        Login.id : (context) => Login(),
        HomeScreen.id : (context) => HomeScreen(),
        Home.id : (context) => Home(),
        Forms.id : (context) => Forms(),
        Cart.id : (context) => Cart(),
        UserBookings.id : (context) => UserBookings(),
        AuthScreen.id : (context) => AuthScreen(),
      },
      ),
    );  
  }
}