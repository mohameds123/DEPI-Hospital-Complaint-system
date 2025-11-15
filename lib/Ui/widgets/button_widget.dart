import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  double height;
  double width;
  String text;
  Color color;
  ButtonWidget({super.key, required this.height, required this.width,required this.text,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.07,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(height * 0.02),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: width * 0.05,
          ),
        ),
      ),
    );
  }
}
