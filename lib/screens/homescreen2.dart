import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midlandfinal/screens/booking.dart';
import 'package:midlandfinal/screens/admission.dart';
import 'package:midlandfinal/screens/cart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:midlandfinal/Login_Options/google login/google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:midlandfinal/screens/forms.dart';



class Home extends StatefulWidget {
  //  final GoogleSignInAccount googleUser;
  // final FirebaseUser firebaseUser;

  // const Home(
  //     {Key key, @required this.googleUser, @required this.firebaseUser})
  //     : assert(googleUser != null),
  //       assert(firebaseUser != null),
  //       super(key: key);
  static const String id = 'homescreen2';

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
          length: 3,
                      child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Color(0xff252B30),
                  bottom: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: new BubbleTabIndicator(
                      indicatorHeight: 65.0,
                      indicatorColor: Colors.black38,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                    tabs: <Widget>[
                      Tab(
                        icon: Icon(
                          FontAwesomeIcons.calendarCheck,
                          color: Color(0xffF7BC45),
                        ),
                        child: Text(
                          'Book',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Icon(FontAwesomeIcons.fileSignature,
                            color: Color(0xffF7BC45)),
                        child: Text(
                          'Admit',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Tab(
                        icon: Icon(FontAwesomeIcons.newspaper,
                            color: Color(0xffF7BC45)),
                        child: Text(
                          'News',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    'MidlandFC',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xffF7BC45)),
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    Booking(),
                    Forms(),
                    Cart(),
                  ],
                ),
              ),
          );
  }
}
