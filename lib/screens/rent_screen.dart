import 'package:flutter/material.dart';
import 'package:odoo_hakathon/screens/bedroom_list.dart';
import 'package:odoo_hakathon/widgets/carousel_slider.dart';
import 'package:odoo_hakathon/widgets/service_circle_widget.dart';

class RentScreen extends StatefulWidget {
  const RentScreen({super.key});

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    double kwidth = MediaQuery.of(context).size.width;
  
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff079dab),
        title: Text("Rent Screen", style: TextStyle(color: Colors.white)),),
      body:  Column(
        children: [
          SizedBox(
                height: kheight * 0.02,
              ),
          Carousel(
                imgURL2: "asset/images/odoo2.jpg",
                imgURL1: "asset/images/odoo5.jpg",
                imgURL3: "asset/images/odoo3.jpg",
                imgURL4: "asset/images/odoo1.jpg",
                imgURL5: "asset/images/odoo4.jpg",
              ),
              SizedBox(
                height: kheight * 0.02,
              ),
          Center(
            child: Container(
                height: kheight * 0.30,
                width: kwidth * 0.93,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 1,
                      offset: Offset(1, 1),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: kwidth * 0.001,
                    mainAxisSpacing: kheight * 0.005,
                    children: [
                      ServiceCircleWidget(
                        radius: 24,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => DiseaseScreen()));
                        },
                        text: "Living",
                        imgUrl: "asset/livingroom.jpg",
                      ),
                      ServiceCircleWidget(
                        radius: 24,
                        onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => BedroomScreen()));
                        },
                        text: "BedRoom",
                        imgUrl: "asset/bedroom.jpg",
                      ),
                      ServiceCircleWidget(
                        radius: 24,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => VaccineList()));
                        },
                        text: "Dining",
                        imgUrl: "asset/dining.jpg",
                      ),
                      ServiceCircleWidget(
                        radius: 24,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => VaccineList()));
                        },
                        text: "Appliances",
                        imgUrl: "asset/appliances.jpg",
                      ),
                      ServiceCircleWidget(
                        radius: 24,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => GuidanceScreen()));
                        },
                        text: "Study",
                        imgUrl: "asset/study.jpg",
                      ),
                      ServiceCircleWidget(
                        radius: 24,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => NutritionScreen()));
                        },
                        text: "Storage",
                        imgUrl: "asset/storage.jpg",
                      ),
                      ServiceCircleWidget(
                        radius: 24,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => DiabeticScreen()));
                        },
                        text: "Kids",
                        imgUrl: "asset/kids.jpg",
                      ),
                      ServiceCircleWidget(
                        radius: 24,
                        onTap: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => DiabeticScreen()));
                        },
                        text: "Z-Category",
                        imgUrl: "asset/z-category.jpg",
                      ),
                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
      );
  }
}