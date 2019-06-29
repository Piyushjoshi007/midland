import 'package:flutter/material.dart';

class Admission extends StatefulWidget {
  Admission({Key key}) : super(key: key);

  _AdmissionState createState() => _AdmissionState();
}

class _AdmissionState extends State<Admission> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Admission'),
      ],
    );
  }
}
