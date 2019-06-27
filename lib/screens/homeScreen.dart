import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'homeScreen';

  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff252B30),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('MidlanFC'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.calendarPlus),
                          iconSize: 60,
                          color: Color(0xffF7BC45),
                          highlightColor: Color(0xffF7BC45),
                          ),
                        ),
                      ),
                      Center(child: Text('Book', style: TextStyle(color: Colors.white, fontSize: 16))),
                    ],
                  ),
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.fileSignature),
                          iconSize: 60,
                          color: Color(0xffF7BC45),
                          highlightColor: Color(0xffF7BC45),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: Text('Join', style: TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ],
                  ),
                    Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                        child: Center(
                          child: IconButton(
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.tshirt),
                          iconSize: 60,
                          color: Color(0xffF7BC45),
                          highlightColor: Color(0xffF7BC45),
                          ),
                        ),
                      ),
                      Text('Buy Merch', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
