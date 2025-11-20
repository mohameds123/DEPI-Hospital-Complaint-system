import 'package:depi_hospital_complaint_system/Ui/screens/login/login_admin.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/login/login_patient.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/login/login_staff.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class Onbaording2 extends StatelessWidget {
  const Onbaording2({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(right: 12, left: 12, top: height * 0.1),
        child: Column(
          spacing: height * 0.04,
          children: [
            Image.asset(
              "assets/image/Your voice builds better care (2) 1.png",
              height: height * 0.205,
            ),
            Text(
              textAlign: TextAlign.center,
              "Welcome to TrustMed\n— Please choose your role",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,

                fontSize: 24,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.176),
              child: Column(
                spacing: 29,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPatient()),
                      );
                    },
                    child: ButtonWidget(
                      height: height,
                      width: width,
                      text: 'Patient',
                      color: Color(0XFF0D6EFD),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginStaff()),
                      );
                    },
                    child: ButtonWidget(
                      height: height,
                      width: width,
                      text: 'Staff',
                      color: Color(0xff25C2A0),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginAdmin()),
                      );
                    },
                    child: ButtonWidget(
                      height: height,
                      width: width,
                      text: 'Admin',
                      color: Color(0xff6C757D),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.06),
            Container(
              width: width * 0.1,
              height: height * 0.05,
              decoration: BoxDecoration(color: Color(0XFF0D6EFD)),
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
