import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Init extends StatefulWidget {
  static String id = 'initial';
  _InitState createState() => _InitState();
}

class _InitState extends State < Init > {
  String dropdownValue = 'Gender';
  DateTime _date = DateTime.now();
  final _formKey = GlobalKey < FormState > ();
  Future < Null > _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2018),
      lastDate: DateTime(2020),
    );
    if (picked != null && picked != _date) {
      print('Date Selected: ${_date.toString()}');
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: < Widget > [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    children: < Widget > [
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: < Widget > [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                'Admission',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            width: 5.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                'Payment',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              ),
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context){
                                //     return ;
                                //   },
                                // ));
                              },
                            ),
                          ),
                          VerticalDivider(
                            color: Colors.black,
                            width: 5.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(width: 1.0, color: Colors.black),
                              ),
                            ),
                            child: FlatButton(
                              child: Text(
                                'Contact US',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.0,
                      ),
                      Row(
                        children: < Widget > [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                              child: Icon(
                                FontAwesomeIcons.userAlt,
                              ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorRadius: Radius.circular(18.0),
                                  cursorWidth: 1.5,
                                  textAlign: TextAlign.start,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                    labelText: "Nam",
                                    labelStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13.0,
                      ),
                      Row(
                        children: < Widget > [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                              child: Icon(
                                FontAwesomeIcons.tint,
                              ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorRadius: Radius.circular(18.0),
                                  cursorWidth: 1.0,
                                  textAlign: TextAlign.start,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                    labelText: "Nam",
                                    labelStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  height: 40.0,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 1.0),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton < String > (
                                      // hint: Text('Awwww'),
                                      iconSize: 18.0,
                                      style: TextStyle(fontSize: 18.0, color: Colors.black),
                                      value: dropdownValue,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: < String > ['Gender', 'Male', 'Female']
                                      .map < DropdownMenuItem < String >> ((String value) {
                                        return DropdownMenuItem < String > (
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                              child: Text(value),
                                          ),
                                        );
                                      })
                                      .toList(),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.0,
                      ),
                      Row(
                        children: < Widget > [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                              child: Icon(
                                Icons.location_on,
                                size: 26.0,
                              ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorRadius: Radius.circular(18.0),
                                  cursorWidth: 1.5,
                                  textAlign: TextAlign.start,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                    labelText: "Nam",
                                    labelStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.0,
                      ),
                      Row(
                        children: < Widget > [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                              child: Icon(
                                Icons.phone,
                                size: 26.5,
                              ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorRadius: Radius.circular(18.0),
                                  cursorWidth: 1.0,
                                  textAlign: TextAlign.start,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                    labelText: "Nam",
                                    labelStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorRadius: Radius.circular(18.0),
                                  cursorWidth: 1.0,
                                  textAlign: TextAlign.start,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                    labelText: "Nam",
                                    labelStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.0,
                      ),
                      Row(
                        children: < Widget > [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                              child: Icon(
                                Icons.email,
                                size: 26.0,
                              ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorRadius: Radius.circular(18.0),
                                  cursorWidth: 1.5,
                                  textAlign: TextAlign.start,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                    labelText: "Nam",
                                    labelStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 17.0,
                      ),
                      Row(
                        children: < Widget > [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                              child: Icon(
                                Icons.date_range,
                                size: 26.0,
                              ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  style: TextStyle(
                                    height: 0.8,
                                  ),
                                  cursorColor: Colors.black,
                                  cursorRadius: Radius.circular(18.0),
                                  cursorWidth: 1.5,
                                  textAlign: TextAlign.start,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        _selectDate(context);
                                      },
                                      icon: Icon(
                                        Icons.date_range,
                                        size: 20.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                    labelText: "Nam",
                                    labelStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 8.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black, width: 1.0, ),
                                      borderRadius: BorderRadius.horizontal(left: Radius.circular(4.0), right: Radius.circular(4.0), ),
                                    ),
                                  ),
                                ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(15.0),
                  height: 500.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}