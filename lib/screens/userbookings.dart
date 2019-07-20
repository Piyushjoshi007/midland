import 'package:flutter/material.dart';

class UserBookings extends StatefulWidget {
  static String id = 'userbookings';
  UserBookings({Key key}) : super(key: key);

  _UserBookingsState createState() => _UserBookingsState();
}

class _UserBookingsState extends State<UserBookings> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: <Widget>[

      ],
    );
  }
}