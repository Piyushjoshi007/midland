import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midlandfinal/screens/booking.dart';
import 'package:midlandfinal/screens/admission.dart';
import 'package:midlandfinal/screens/cart.dart';

class Home extends StatefulWidget {
  static const String id = 'homescreen2';

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff252B30),
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: new BubbleTabIndicator(
                  indicatorHeight: 50.0,
                  indicatorColor: Colors.black38,
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                ),
                tabs: <Widget>[
                  Tab(
                      icon: Icon(
                    FontAwesomeIcons.calendarCheck,
                    color: Color(0xffF7BC45),
                  )),
                  Tab(
                      icon: Icon(FontAwesomeIcons.fileSignature,
                          color: Color(0xffF7BC45))),
                  Tab(
                      icon: Icon(FontAwesomeIcons.cartPlus,
                          color: Color(0xffF7BC45))),
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
                Admission(),
                Cart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
