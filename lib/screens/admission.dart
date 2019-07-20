import 'package:flutter/material.dart';
import 'package:midlandfinal/screens/initial.dart';

class Admission extends StatefulWidget {
  static String id = 'admission';
  Admission({Key key}) : super(key: key);

  _AdmissionState createState() => _AdmissionState();
}

class _AdmissionState extends State<Admission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Init(),
    );
  }
}
