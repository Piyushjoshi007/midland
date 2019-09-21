import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();


class Forms extends StatelessWidget {
  const Forms({Key key}) : super(key: key);
  static const String id = 'forms';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
      color: Color(0xffE5E5E5),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(18),
            child: Container(
              child: Text(
                'We will contact you as soon as possible',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          FormBuilder(
            key: _fbKey,
            autovalidate: true,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(9),
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        attribute: "Student_Name",
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: "Name of Child",
                          hintText: "Full Name",
                        ),
                        validators: [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.minLength(5),
                        ],
                      ),
                      FormBuilderDateTimePicker(
                        decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: "Birthdate"),
                        attribute: "Birth_Date",
                        inputType: InputType.date,
                      ),
                      FormBuilderTextField(
                        attribute: "Parents_Name",
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: "Enter Parents Name",
                          hintText: "Full Name",
                        ),
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      FormBuilderTextField(
                          attribute: "Parents_Number",
                          decoration: InputDecoration(
                            icon: Icon(Icons.phone_iphone),
                            labelText: "Parents Number",
                            hintText: "Best number to reach You",
                          ),
                          keyboardType: TextInputType.number,
                          validators: [
                            FormBuilderValidators.maxLength(10,
                                errorText:
                                    "Value must have a length equal to 10"),
                            FormBuilderValidators.minLength(10,
                                errorText:
                                    "Value must have a length equal to 10"),
                            FormBuilderValidators.required(),
                          ]),
                      FormBuilderDropdown(
                        attribute: "gender",
                        decoration: InputDecoration(
                          labelText: "Gender",
                          icon: Icon(Icons.child_friendly),
                        ),
                        // initialValue: 'Male',
                        hint: Text('Select Gender'),
                        validators: [FormBuilderValidators.required()],
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                                value: gender, child: Text("$gender")))
                            .toList(),
                      ),
                      FormBuilderSlider(
                        attribute: "age",
                        decoration: InputDecoration(
                            labelText: "Age", icon: Icon(Icons.child_care)),
                        initialValue: 10.0,
                        min: 7.0,
                        max: 17.0,
                        divisions: 10,
                      ),
                      FormBuilderDropdown(
                        attribute: "Location",
                        decoration: InputDecoration(
                          labelText: 'Preffered Location',
                          hintText: 'Select Location',
                          icon: Icon(Icons.location_on),
                        ),
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                        items: ['Omkar Nagar', 'New Sneh Nagar']
                            .map((location) => DropdownMenuItem(
                                value: location, child: Text("$location")))
                            .toList(),
                      ),
                      FormBuilderCheckbox(
                        attribute: 'accept_terms',
                        initialValue: false,
                        label: Text(
                            "I have read and agree to the terms and conditions"),
                        validators: [
                          FormBuilderValidators.requiredTrue(
                            errorText:
                                "You must accept terms and conditions to continue",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
                disabledColor: Colors.grey,
                elevation: 2,
                onPressed: () {
                  _fbKey.currentState.save();
                  if (_fbKey.currentState.validate()) {
                    Firestore.instance
                      .collection('Admission')
                      .document()
                      .setData({
                    'Time': DateTime.now(),
                    'Student_Name' : _fbKey.currentState.value["Student_Name"],
                    "Birth_Date" : _fbKey.currentState.value["Birth_Date"],
                    'Location' : _fbKey.currentState.value["Location"],
                    'Parents_Name' : _fbKey.currentState.value["Parents_Name"],
                    'Parents_Number' : _fbKey.currentState.value["Parents_Number"],
                    'accept_terms' : _fbKey.currentState.value["accept_terms"],
                    'age' : _fbKey.currentState.value["age"],
                    'gender' : _fbKey.currentState.value["gender"],
                  });
                  }
                },
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.black,
                disabledColor: Colors.grey,
                elevation: 2,
                onPressed: () {
                  _fbKey.currentState.reset();
                },
              ),
            ],
          )
        ],
      ),
    ))));
  }
}
