import 'package:flutter/material.dart';

class PastBookings extends StatefulWidget {
  PastBookings({Key key}) : super(key: key);

  _PastBookingsState createState() => _PastBookingsState();
}

class _PastBookingsState extends State<PastBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(child: Text('Your Past Booking will appear here', style: TextStyle(fontSize: 25, color: Colors.black45))),

    );
  }
}