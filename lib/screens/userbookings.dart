import 'package:flutter/material.dart';
import 'package:midlandfinal/screens/booking.dart';
import 'package:midlandfinal/screens/livebookings.dart';
import 'package:midlandfinal/screens/pastbookings.dart';
import 'package:midlandfinal/screens/userorders.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:midlandfinal/screens/homescreen2.dart';



class UserBookings extends StatefulWidget {
  static String id = 'userbookings';
  
  UserBookings({Key key}) : super(key: key);

  _UserBookingsState createState() => _UserBookingsState();
}

class _UserBookingsState extends State<UserBookings> {
  int _selectedIndex = 1;
  int _currentPage = 1;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(      
          backgroundColor: Color(0xff252B30),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.calendar_today, color: Color(0xffF7BC45),),
                child: Text('Live Bookings'),
              ),
              Tab(
                icon: Icon(Icons.featured_play_list, color: Color(0xffF7BC45),),
                child: Text('Past Bookings'),
              ),
              Tab(
                icon: Icon(Icons.shopping_cart, color: Color(0xffF7BC45),),
                child: Text('Your Orders'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            LiveBooking(),
            PastBookings(),
            UserOrders(),
          ],
        ),
        bottomNavigationBar: DefaultTabController(
          length: 2,
                  child: BubbleBottomBar(
           opacity: .2,
          currentIndex: _selectedIndex,
          onTap: (position){
            setState(() {
              _currentPage = position;
              if(_currentPage == 0){
                Navigator.pop(context, Home.id);
              }
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
        ),
      ),
    );
  }
}
