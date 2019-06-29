import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatelessWidget {
  static const String id = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Container(
                height: 260,
                width: 260,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    child: Image.asset('images/logo1.jpg'),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff252B30),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 5, 0, 9),
                      child: Icon(
                        FontAwesomeIcons.google,
                        size: 25,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.white30,
                      margin: const EdgeInsets.only(
                        left: 10.0,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Continue with Google',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xffCCCFD0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff252B30),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 5, 0, 9),
                      child: Icon(
                        FontAwesomeIcons.facebookF,
                        size: 25,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.white30,
                      margin: const EdgeInsets.only(
                        left: 10.0,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Continue with Facebook',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xffCCCFD0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 25),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff252B30),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 5, 0, 9),
                      child: Icon(
                        FontAwesomeIcons.mobileAlt,
                        size: 25,
                      ),
                    ),
                    Container(
                      height: 30.0,
                      width: 1.0,
                      color: Colors.white30,
                      margin: const EdgeInsets.only(
                        left: 10.0,
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          'Continue with Number',
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xffCCCFD0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
