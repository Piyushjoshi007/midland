import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  static const String id = 'booking';

  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choose a time to book'),
        ),

      ),
    );
  }
}