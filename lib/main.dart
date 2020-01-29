import 'package:flutter/material.dart';
import 'package:flutter_node/screens/login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Videogames',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
