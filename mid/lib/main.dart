import 'package:flutter/material.dart';
import 'package:mid/home.dart';
import 'package:mid/splash.dart';
import 'package:mid/players.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  @override
  _SoccerAppState createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/":(context) => SplashScreen(),
        "homePage":(context) => HomePage(),
      
      
      },
      
    );
  }
}
