import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:midlandfinal/src/calender.dart';
import 'package:midlandfinal/screens/navigationButton.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:midlandfinal/screens/userbookings.dart';
import 'package:midlandfinal/Login_Options/email-pass-login/auth-screen.dart';

class Booking extends StatefulWidget {
  Booking({Key key}) : super(key: key);

  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  int currentPage = 0;
  int _selectedIndex = 0;
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        Booking(),
        UserBookings(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double deviceWidth = size.width;
    final double deviceHeight = size.height;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: Container(
              child: MyHomePage(),
              height: deviceHeight,
              width: deviceWidth,
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 18, 0),
        child: Transform.scale(
          scale: 1.2,
          child: FloatingActionButton.extended(
            backgroundColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, Cart.id);
            },
            label: Text('Book'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: DefaultTabController(
        length: 2,
        child: BubbleBottomBar(
          opacity: .2,
          currentIndex: _selectedIndex,
          onTap: (position) {
            setState(() {
              currentPage = position;
              if (currentPage == 1) {
                Navigator.pushNamed(context, UserBookings.id);
              } else {
                Navigator.canPop(context);
              }
            });
          },
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          elevation: 10,
          fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: false, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor:
              Colors.black12, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.red,
                icon: Icon(
                  Icons.featured_play_list,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.featured_play_list,
                  color: Colors.red,
                ),
                title: Text(
                  "Time Table",
                  style: TextStyle(fontSize: 10),
                )),
            BubbleBottomBarItem(
                backgroundColor: Colors.green,
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                title: Text("Bookings")),
          ],
        ),
      ),
    );
  }
}
