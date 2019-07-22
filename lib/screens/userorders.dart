import 'package:flutter/material.dart';

class UserOrders extends StatefulWidget {
  UserOrders({Key key}) : super(key: key);

  _UserOrdersState createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Center(child: Text('Your Orders will appear here', style: TextStyle(fontSize: 25, color: Colors.black45))),

    );
  }
}