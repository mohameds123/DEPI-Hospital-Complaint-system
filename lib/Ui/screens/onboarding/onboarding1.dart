import 'package:depi_hospital_complaint_system/Ui/screens/onboarding/onbaording2.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Column(
          spacing: 74,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/Your voice builds better care 2.png"),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onbaording2()),
                );
              },
              child: ButtonWidget(
                color: Color(0xff0D6EFD),
                height: height,
                width: width,
                text: "GET Started",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
