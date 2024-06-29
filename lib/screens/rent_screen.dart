import 'package:flutter/material.dart';
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
      body:  Container(
          height: kheight * 0.23,
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
                  imgUrl: "assets/livingroom.jpg",
                ),
                ServiceCircleWidget(
                  radius: 24,
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => TestsScreen(allTests)));
                  },
                  text: "BedRoom",
                  imgUrl: "assets/bedroom.jpg",
                ),
                ServiceCircleWidget(
                  radius: 24,
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => VaccineList()));
                  },
                  text: "Dining",
                  imgUrl: "assets/dining.jpg",
                ),
                ServiceCircleWidget(
                  radius: 24,
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => VaccineList()));
                  },
                  text: "Appliances",
                  imgUrl: "assets/appliances.jpg",
                ),
                ServiceCircleWidget(
                  radius: 24,
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => GuidanceScreen()));
                  },
                  text: "Study",
                  imgUrl: "assets/study.jpg",
                ),
                ServiceCircleWidget(
                  radius: 24,
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => NutritionScreen()));
                  },
                  text: "Storage",
                  imgUrl: "assets/storage.jpg",
                ),
                ServiceCircleWidget(
                  radius: 24,
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DiabeticScreen()));
                  },
                  text: "Kids",
                  imgUrl: "assets/kids.jpg",
                ),
                ServiceCircleWidget(
                  radius: 24,
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => DiabeticScreen()));
                  },
                  text: "Z-Category",
                  imgUrl: "assets/z-category.jpg",
                ),
              ],
            ),
          ),
        ),
      );
  }
}