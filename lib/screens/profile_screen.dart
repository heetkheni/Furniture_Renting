import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odoo_hakathon/Auth/loginScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    gettingUserData(user.uid);
  }

  Future<void> gettingUserData(String id) async {
    try {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
      setState(() {
        userData = userDoc.data() as Map<String, dynamic>?;
      });
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff079dab),
        title: Text("Profile Screen", style: TextStyle(color: Colors.white)),
      ),
      body: userData == null
          ? Center(
              child: CircularProgressIndicator(
              strokeWidth: 5,
            ))
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Color(0XFF079dab),
                      child: Center(
                        child: Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    itemProfile(
                        'Name', userData!['name'], CupertinoIcons.person),
                    const SizedBox(height: 20),
                    itemProfile(
                        'Email', userData!['email'], CupertinoIcons.mail),
                    const SizedBox(
                      height: 250,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            await signOut().then((value) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (route) => false);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(15),
                            backgroundColor: Color(0XFF079dab),
                          ),
                          child: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust the padding as needed
        child: Row(
          children: [
            Icon(iconData),
            SizedBox(width: 12), // Adjust the spacing between the icon and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}