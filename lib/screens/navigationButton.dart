import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Cart extends StatefulWidget {
  static String id = 'navigationButton';
  Cart({Key key}) : super(key: key);

  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double deviceWidth = size.width;
    final double deviceHeight = size.height;
    print(deviceWidth);
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Manewada Square'),
          background: Image.network(
            'http://www.aljanh.net/data/archive/img/2753406144.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        expandedHeight: deviceHeight / 3,
      ),
      SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: deviceHeight/20,
                width: deviceWidth,
                color: Colors.black,
                child: Center(child: Text('Book', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),)),
              ),
              SafeArea(
                  child: Material(
                  child: Column(children: <Widget>[
                         Align(
                        alignment: Alignment(-0.9, -1),
                        child: Text(
                          'Day, Date and Time - ',
                          style: TextStyle(fontSize: deviceWidth / 30, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: deviceHeight / 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(Icons.access_time),
                        ),
                         Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text(
                                  'Tuesday,',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontSize: deviceWidth / 22),
                                ),
                              ),
                          Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '23 July',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontSize: deviceWidth /22),
                                ),
                              ),
                                  Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '06:00 pm - 07:00pm',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: deviceHeight / 60),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                          width: deviceWidth/1.1,
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: deviceHeight/20,
                        ),
                    Align(
                        alignment: Alignment(-0.9, -1),
                        child: Text(
                          'Price',
                          style: TextStyle(fontSize: deviceHeight / 60, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: deviceHeight / 40,
                    ),
                    Row(
                                            mainAxisAlignment: MainAxisAlignment.start,

                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Icon(FontAwesomeIcons.rupeeSign, color: Colors.black38,),
                        ),
                         Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  'Hrs Booking fee',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w300,
                                      fontSize: deviceHeight / 40),
                                ),
                              ),
                          Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  '1200/-',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: deviceHeight / 30),
                                ),
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                          width: deviceWidth/1.1,
                          height: 1,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: deviceHeight/20,
                        ),
                        Material(
                      child: Column(
                        children: <Widget>[
                          Align(
                              alignment: Alignment(-0.9, -1),
                              child: Text(
                                'Payment Method',
                                style: TextStyle(fontSize: deviceHeight / 60, fontWeight: FontWeight.w600),
                              )),
                          SizedBox(
                            height: deviceHeight / 40,
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'Payment Option',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w300,
                                      fontSize: deviceHeight / 50),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            height: 1,
                            width: deviceWidth/1.1,
                            color: Colors.black,
                          ),
                        ]
                      )
                        ),
                        SizedBox(
                          height: deviceHeight/20,
                        ),
                        RaisedButton(
                          color: Colors.brown,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
                            child:Column(
                              children: <Widget>[
                                 Text('Book', style: TextStyle(fontSize: 20),),
                                 Text('₹ 1200/- ')
                              ],
                            ),
                          ),
                          onPressed: (){},
                        ),
                  ]
                  
                ),
                ),
              ),
            ],
          ),
      ),
    ],),);
  }
}
