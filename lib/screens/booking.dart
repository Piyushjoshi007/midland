import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midlandfinal/src/calender.dart';
import 'package:midlandfinal/screens/homescreen2.dart';
import 'package:midlandfinal/screens/navigationButton.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';


class Booking extends StatefulWidget {
  Booking({Key key}) : super(key: key);

  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  int currentPage = 0;
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
                label: Text('Tap to book'),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.center,
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: <Widget>[
                //     SizedBox(
                //       height: deviceHeight/35,
                //       width: deviceWidth/12,
                //       child: Container(
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8),
                //           color: Colors.white,
                //         ),
                //         child: Center(child: Text('Proceed with 2 booking',style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),)),
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: currentPage,
          onTap: (position){
            setState(() {
              currentPage = position;
            });
          },
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          elevation: 10,
          fabLocation: BubbleBottomBarFabLocation.end, //new
          hasNotch: false, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor: Colors.black12, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.featured_play_list, color: Colors.black,), activeIcon: Icon(Icons.featured_play_list, color: Colors.red,), title: Text("Time Table", style: TextStyle(fontSize: 10),)),
              BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.person, color: Colors.black,), activeIcon: Icon(Icons.person, color: Colors.green,), title: Text("Bookings")),
          ],
        ),
          
          );
  }
}
