import 'package:flutter/material.dart';

class LiveBooking extends StatefulWidget {
  LiveBooking({Key key}) : super(key: key);

  _LiveBookingState createState() => _LiveBookingState();
}

class _LiveBookingState extends State<LiveBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Your Booking will appear here', style: TextStyle(fontSize: 25, color: Colors.black45))),
    );
  }
}