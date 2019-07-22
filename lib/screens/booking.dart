import 'package:flutter/material.dart';
import 'package:midlandfinal/src/calender.dart';
import 'package:midlandfinal/screens/navigationButton.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:midlandfinal/screens/userbookings.dart';




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
                label: Text('Tap to book'),
              ),
            ),
          ),
          
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//           bottomNavigationBar: BottomNavyBar(
//    selectedIndex: _selectedIndex,
//    showElevation: true, // use this to remove appBar's elevation
//    onItemSelected: (index) => setState(() {
//               _selectedIndex = index;
//               _pageController.animateToPage(index,
//                   duration: Duration(milliseconds: 300), curve: Curves.ease);
//     }),
//    items: [
//      BottomNavyBarItem(
//        icon: Icon(Icons.apps),
//        title: Text('Home'),
//        activeColor: Colors.red,
//      ),
//      BottomNavyBarItem(
//          icon: Icon(Icons.people),
//          title: Text('Users'),
//          activeColor: Colors.purpleAccent
//      ),
//      BottomNavyBarItem(
//          icon: Icon(Icons.message),
//          title: Text('Messages'),
//          activeColor: Colors.pink
//      ),
//      BottomNavyBarItem(
//          icon: Icon(Icons.settings),
//          title: Text('Settings'),
//          activeColor: Colors.blue
//      ),
//    ],
// ),



          // bottomNavigationBar: DefaultTabController(
          //   length: 1,
          //             child: BottomNavigationBar(
          //     items: <BottomNavigationBarItem>[
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.list),
          //         title: Text('Time Table'),
          //       ),
          //        BottomNavigationBarItem(
          //         icon: Icon(Icons.person),
          //         title: Text('Bookings'),
          //       ),
          //     ],
          //   ),
          // ),
        bottomNavigationBar: DefaultTabController(
          length: 2,
                  child: BubbleBottomBar(
           opacity: .2,
          currentIndex: _selectedIndex,
          onTap: (position){
            setState(() {
              currentPage = position;
              if(currentPage == 1){
                Navigator.pushNamed(context, UserBookings.id);
              }else{
                Navigator.canPop(context);
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
      );
      
  }
}
