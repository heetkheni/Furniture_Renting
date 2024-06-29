import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:odoo_hakathon/screens/rent_screen.dart';
import 'package:odoo_hakathon/widgets/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    double kwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff079dab),
        title: Text("Home Screen", style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: kheight * 0.02,
              ),
              Carousel(
                imgURL1: "asset/images/odoo5.jpg",
                imgURL2: "asset/images/odoo2.jpg",
                imgURL3: "asset/images/odoo3.jpg",
                imgURL4: "asset/images/odoo1.jpg",
                imgURL5: "asset/images/odoo4.jpg",
              ),
              SizedBox(
                height: kheight * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RentScreen()),
                  );
                },
                child: Image.asset(
                  'asset/images/rentToday.jpg',
                  
                  width: kwidth * 0.9,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: kheight * 0.02,
              ),
              Image.asset(
                  'asset/images/review1.jpg',
                  height: kheight * 0.2,
                  width: kwidth * 0.9,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                height: kheight * 0.02,
              ),
                Image.asset(
                  'asset/images/review2.jpg',
                  height: kheight * 0.2,
                  width: kwidth * 0.9,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                height: kheight * 0.02,
              ),
                Image.asset(
                  'asset/images/review3.jpg',
                  height: kheight * 0.2,
                  width: kwidth * 0.9,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                height: kheight * 0.02,
              ),
                Image.asset(
                  'asset/images/review5.jpg',
                  height: kheight * 0.2,
                  width: kwidth * 0.9,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                height: kheight * 0.02,
              ),
               
            ],
          ),
        ),
      ),
    );
  }
}
