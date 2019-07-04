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
    return Scaffold(
      body: SafeArea(
              child: Column(
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.only(top: 20),
            //   child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: <Widget>[
            //     Icon((FontAwesomeIcons.longArrowAltLeft)),
            //     Text(
            //       'Book Turf',
            //       style: TextStyle(
            //         fontWeight: FontWeight.w600,
            //         fontSize: 30,
            //       ),
            //     ),
            //      Icon((FontAwesomeIcons.bars)),
            //   ],
            //   ),
            // ),
           Flexible(
          child: Container(
          child: MyHomePage(),
             height: deviceHeight,
             width: deviceWidth,
                 ),
           ),
          ],
        ),
      ),
    );
  }
}
