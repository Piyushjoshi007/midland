//  Copyright (c) 2019 Aleksander Woźniak
//  Licensed under Apache License v2.0

import 'package:date_utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'event.dart';

// // Example holidays
// final Map<DateTime, List> _holidays = {
//   DateTime(2019, 1, 1): ['New Year\'s Day'],
//   DateTime(2019, 1, 6): ['Epiphany'],
//   DateTime(2019, 2, 14): ['Valentine\'s Day'],
//   DateTime(2019, 4, 21): ['Easter Sunday'],
//   DateTime(2019, 4, 22): ['Easter Monday'],
// };

String date = DateTime.now().day.toString();
String month = DateTime.now().month.toString();
String year = DateTime.now().year.toString();

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  DateTime _selectedDay;
  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  List _selectedEvents;
  AnimationController _controller;
  var _selectedEvent =  Event();

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _events = {
      _selectedDay: [
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ],
      _selectedDay.add(Duration(days: 1)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 2)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 3)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 4)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 5)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 6)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 7)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 8)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 9)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 10)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 11)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 12)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 13)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
      _selectedDay.add(Duration(days: 14)): Set.from([
        '6:00 AM - 7:00 AM',
        '7:00 AM - 8:00 AM',
        '8:00 AM - 9:00 AM',
        '9:00 AM - 10:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 PM - 1:00 PM',
        '1:00 PM - 2:00 PM',
        '2:00 PM - 3:00 PM',
        '3:00 PM - 4:00 PM',
        '4:00 PM - 5:00 PM',
        '5:00 PM - 6:00 PM',
        '6:00 PM - 7:00 PM',
        '7:00 PM - 8:00 PM',
        '8:00 PM - 9:00 PM',
        '9:00 PM - 10:00 PM',
        '10:00 PM - 11:00 PM',
      ]).toList(),
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _visibleEvents = _events;
    // _visibleHolidays = _holidays;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _controller.forward();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    setState(() {
      _visibleEvents = Map.fromEntries(
        _events.entries.where(
          (entry) =>
              entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );

      // _visibleHolidays = Map.fromEntries(
      //   _holidays.entries.where(
      //     (entry) =>
      //         entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
      //         entry.key.isBefore(last.add(const Duration(days: 1))),
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Switch out 2 lines below to play with TableCalendar's settings
          //-----------------------
          _buildTableCalendar(),
          //_buildTableCalendarWithBuilders(),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      headerVisible: true,
      startDay: DateTime.now().subtract(Duration(days: 1)),
      endDay: DateTime.now().add(Duration(days: 13)),
      locale: 'en_US',
      events: _visibleEvents,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        selectedColor: Colors.deepOrange[400],
        todayColor: Colors.deepOrange[200],
      ),
      // headerStyle: HeaderStyle(
      //   formatButtonTextStyle: TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
      //   formatButtonDecoration: BoxDecoration(
      //     color: Colors.deepOrange[400],
      //     borderRadius: BorderRadius.circular(16.0),
      //   ),
      // ),
      onDaySelected: _onDaySelected,
      onVisibleDaysChanged: _onVisibleDaysChanged,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)

  // Widget _buildTableCalendarWithBuilders() {
  //   return TableCalendar(
  //     locale: 'en_US',
  //     events: _visibleEvents,
  //     holidays: _visibleHolidays,
  //     initialCalendarFormat: CalendarFormat.twoWeeks,
  //     formatAnimation: FormatAnimation.slide,
  //     startingDayOfWeek: StartingDayOfWeek.sunday,
  //     availableGestures: AvailableGestures.all,
  //     availableCalendarFormats: const {
  //       CalendarFormat.twoWeeks: '',
  //     },
  //     calendarStyle: CalendarStyle(
  //       outsideDaysVisible: false,
  //       weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
  //       holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
  //     ),
  //     daysOfWeekStyle: DaysOfWeekStyle(
  //       weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
  //     ),
  //     headerStyle: HeaderStyle(
  //       centerHeaderTitle: true,
  //       formatButtonVisible: false,
  //     ),
  //     builders: CalendarBuilders(
  //       selectedDayBuilder: (context, date, _) {
  //         return FadeTransition(
  //           opacity: Tween(begin: 0.0, end: 1.0).animate(_controller),
  //           child: Container(
  //             margin: const EdgeInsets.all(4.0),
  //             padding: const EdgeInsets.only(top: 5.0, left: 6.0),
  //             color: Colors.deepOrange[300],
  //             width: 100,
  //             height: 100,
  //             child: Text(
  //               '${date.day}',
  //               style: TextStyle().copyWith(fontSize: 16.0),
  //             ),
  //           ),
  //         );
  //       },
  //       todayDayBuilder: (context, date, _) {
  //         return Container(
  //           margin: const EdgeInsets.all(4.0),
  //           padding: const EdgeInsets.only(top: 5.0, left: 6.0),
  //           color: Colors.amber[400],
  //           width: 100,
  //           height: 100,
  //           child: Text(
  //             '${date.day}',
  //             style: TextStyle().copyWith(fontSize: 16.0),
  //           ),
  //         );
  //       },
  //       // markersBuilder: (context, date, events, holidays) {
  //       //   final children = <Widget>[];

  //       //   if (events.isNotEmpty) {
  //       //     children.add(
  //       //       Positioned(
  //       //         right: 1,
  //       //         bottom: 1,
  //       //         child: _buildEventsMarker(date, events),
  //       //       ),
  //       //     );
  //       //   }

  //       //   if (holidays.isNotEmpty) {
  //       //     children.add(
  //       //       Positioned(
  //       //         right: -2,
  //       //         top: -2,
  //       //         child: _buildHolidaysMarker(),
  //       //       ),
  //       //     );
  //       //   }

  //       //   return children;
  //       // },
  //     ),
  //     onDaySelected: (date, events) {
  //       _onDaySelected(date, events);
  //       _controller.forward(from: 0.0);
  //     },
  //     onVisibleDaysChanged: _onVisibleDaysChanged,
  //   );
  // }

  // Widget _buildEventsMarker(DateTime date, List events) {
  //   return AnimatedContainer(
  //     duration: const Duration(milliseconds: 300),
  //     decoration: BoxDecoration(
  //       shape: BoxShape.rectangle,
  //       color: Utils.isSameDay(date, _selectedDay)
  //           ? Colors.brown[500]
  //           : Utils.isSameDay(date, DateTime.now()) ? Colors.brown[300] : Colors.blue[400],
  //     ),
  //     width: 16.0,
  //     height: 16.0,
  //     child: Center(
  //       child: Text(
  //         '${events.length}',
  //         style: TextStyle().copyWith(
  //           color: Colors.white,
  //           fontSize: 12.0,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildHolidaysMarker() {
  //   return Icon(
  //     Icons.add_box,
  //     size: 20.0,
  //     color: Colors.blueGrey[800],
  //   );
  // }

  Widget _buildEventList() {
    var boxdecoration;
    return ListView(
      children: _selectedEvents
          .map(
            (event) => Container(
              decoration: boxdecoration,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 6, 10, 2),
                child: Material(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  elevation: 4,
                  child: ListTile(
                      subtitle: Text('Open for booking'),
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          event.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      onLongPress: () {
                        setState(() {
                          _selectedEvent = event;
                          if(_selectedEvent == event){
                             boxdecoration = BoxDecoration(
                                 color : Colors.amber,
                            );
                            }
                        });
                      }),
                      
                ),
                
              ),
            ),
          )
          .toList(),
    );
    

  }

  // Widget _reallist() {
  //   return ListView.builder(
  //     itemCount: _selectedEvents.length,
  //     itemBuilder: (context, position) {
  //       if(_selectedEvent == eventname){

  //       }
  //       return Padding(
  //         padding: const EdgeInsets.fromLTRB(10, 6, 10, 2),
  //         child: Material(
  //           borderRadius: BorderRadius.only(
  //               topRight: Radius.circular(20),
  //               bottomLeft: Radius.circular(20),
  //               bottomRight: Radius.circular(20)),
  //           elevation: 4,
  //           child: ListTile(
  //             subtitle: Text('Open for booking'),
  //             title: Padding(
  //               padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
  //               child: Text(
  //                 _selectedEvents[position],
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.w500,
  //                   fontSize: 18,
  //                 ),
  //               ),
  //             ),
  //             onTap: (){
  //               _selectedEvent = _events;
  //             },
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
