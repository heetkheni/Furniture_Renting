

import 'package:flutter/material.dart';

class ServiceCircleWidget extends StatelessWidget {


  ServiceCircleWidget({
    super.key,
    required this.radius,
    required this.onTap,
    required this.text,
    required this.imgUrl,
  });

  final double radius;
  VoidCallback onTap;
  final String text;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    double kheight = MediaQuery.of(context).size.height;
    double kwidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      splashColor: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: Colors.white,
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: kheight * 0.003,
          ),
          Center(
            child: Text(
              text,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}