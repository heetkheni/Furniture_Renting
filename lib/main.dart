import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:odoo_hakathon/Auth/loginScreen.dart';
import 'package:odoo_hakathon/screens/bedroom_list.dart';
import 'package:odoo_hakathon/screens/main_screen.dart';
import 'package:odoo_hakathon/screens/payment_screen.dart';
import 'package:odoo_hakathon/screens/profile_screen.dart';
import 'package:odoo_hakathon/screens/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    final user = auth.currentUser;

    if (user == null) {
      setState(() {
        isUserLoggedIn = false;
      });
    } else {
      isUserLoggedIn = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Furniture_Renting',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0XFF079dab),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // home: MainScreen(),
      home: SplashScreen(loggedInStatus: isUserLoggedIn,),
    );
  }
}