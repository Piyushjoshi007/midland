import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        body: SafeArea(
          child: Column(
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
                Center(
                    child: Text('Book',
                        style: TextStyle(
                            color: Colors.white, fontSize: 16))),
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
                  child: Text('Join',
                      style:
                          TextStyle(color: Colors.white, fontSize: 16)),
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
                Text('Buy Merch',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ],
        ),
                ),
                Padding(
        padding: const EdgeInsets.fromLTRB(80, 50, 80, 40),
        child: Container(
          height: 0.9,
          color: Colors.white,
        ),
                ),
                Container(
        child: Text(
          'Announcements and news',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
                ),
                SizedBox(
        height: 10,
                ),
                Card(
        child: Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(
              vertical: 40,
            )),
            Flexible(
                child: Text(
              'Blah asd asdwe sdsjas wdsa asdasd asdas d asd a sd a da da asd adasd as da  s',
              style: TextStyle(fontSize: 18),
            )),
            Container(
              height: 10,
              color: Colors.white,
            ),
          ],
        ),
                ),
                Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Text('Recent Achivements', style: TextStyle(fontSize: 18),)),
            ),
            SizedBox(
              height: 5,
            ),
            CarouselSlider(
                autoPlay: true,
                height: 200.0,
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              ),
            child: Text(
              'text $i',
              style: TextStyle(fontSize: 16.0),
            ));
                    },
                  );
                }).toList(),
              )
          ],
        ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
