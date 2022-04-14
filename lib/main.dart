import '../screens/landing_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF2B2B2B),
      ),
      home: LandingScreen(),
    ),
  );
}