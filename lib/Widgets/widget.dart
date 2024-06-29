import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    labelStyle: TextStyle(
        color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 15),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2)),
    // enabledBorder: OutlineInputBorder(
    //     borderSide: BorderSide(color: Colors.grey, width: 2)),
    border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey, width: 2)),
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2)));

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 14),
      ),
    ),
    backgroundColor: color,
    duration: Duration(seconds: 2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ));
}

class IconWidgetData extends StatelessWidget {
  String path;
  String text;
  IconWidgetData({Key? key, required this.path, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: Image.asset(
            path,
            scale: 1.5,
          ),
          backgroundColor: Colors.white,
          radius: 30,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
