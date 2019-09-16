import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier{
  String _token;
  String _expiryDate;
  String _userid;

  Future<void> signup(String email,String password)async{
      const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCh_THYgp1iku2FekQexMw7LSHiiaauoUI';
      final response = await http.post(url, body: json.encode({'email': email, 'password': password, 'returnSecureToken': true}));
      print(json.decode(response.body));
  }

   Future<void> login(String email,String password)async{
      const url = 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCh_THYgp1iku2FekQexMw7LSHiiaauoUI';
      final response = await http.post(url, body: json.encode({'email': email, 'password': password, 'returnSecureToken': true}));
      print(json.decode(response.body));
  }
  

}