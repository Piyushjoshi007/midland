import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midlandfinal/src/calender.dart';
import 'package:midlandfinal/screens/homescreen2.dart';

class Booking extends StatefulWidget {
  Booking({Key key}) : super(key: key);

  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double deviceWidth = size.width;
    final double deviceHeight = size.height;
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: <Widget>[
              Flexible(
                child: Container(
                  child: MyHomePage(),
                  height: deviceHeight,
                  width: deviceWidth,
                ),
              ),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
            child: Transform.scale(
              scale: 1.2,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                onPressed: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: deviceHeight/35,
                      width: deviceWidth/18,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Center(child: Text('1',style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
