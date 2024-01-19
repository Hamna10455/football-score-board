import 'dart:async';
import 'package:flutter/material.dart';
import './home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/s.png",
                height: 370,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Football Scoreboard App",
                style: TextStyle(color: Color.fromARGB(252, 47, 12, 68),
                fontSize: 35,
                
                fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
