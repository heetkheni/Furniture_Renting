import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:odoo_hakathon/screens/admin/course_add_screen.dart';
import 'package:odoo_hakathon/screens/bedroom_list.dart';
import 'package:odoo_hakathon/screens/home_screen.dart';
import 'package:odoo_hakathon/screens/rent_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff079dab)),
        useMaterial3: true,
      ),
      home: RentScreen(),
    );
  }
}