import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  double height;
  double width;
  String text;
  Color color;
  bool loadingState;
  ButtonWidget({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.color,
    this.loadingState = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height * 0.068,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: (loadingState)
            ? Center(child: CircularProgressIndicator())
            : Text(
                text,
                style: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}
