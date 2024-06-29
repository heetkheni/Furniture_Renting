import 'dart:async';
import 'package:odoo_hakathon/screens/home_screen.dart';
import 'package:odoo_hakathon/Auth/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:odoo_hakathon/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  bool loggedInStatus;
  SplashScreen({Key? key, required this.loggedInStatus}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.loggedInStatus) {
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()));
      });
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "asset/splash.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "Rent Today, Enjoy Tomorrow",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                  color: Color(0XFF079dab)),
            ),
          ),
        ],
      ),
    );
  }
}
