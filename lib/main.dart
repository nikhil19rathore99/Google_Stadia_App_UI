import 'package:flutter/material.dart';
import 'package:google_stadia_ui/screens/landingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Colors.white,
          primarySwatch: Colors.blue,
          fontFamily: 'Oxygen'),
      home: LandingPage(),
    );
  }
}
