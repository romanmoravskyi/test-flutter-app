import 'package:flutter/material.dart';
import 'package:test_flutter_app/screens/main_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Random Data',
    theme: ThemeData(
      primaryColor: Colors.white,
    ),
    home: MainScreen(),
  ));
}
