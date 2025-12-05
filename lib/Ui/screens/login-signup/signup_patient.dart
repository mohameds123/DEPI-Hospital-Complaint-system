import 'package:depi_hospital_complaint_system/Ui/screens/home_patient.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/login-signup/login_patient.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/button_widget.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';

import 'package:flutter/material.dart';

class SignUpPatient extends StatefulWidget {
  const SignUpPatient({super.key});

  @override
  State<SignUpPatient> createState() => _SignUpPatientState();
}

class _SignUpPatientState extends State<SignUpPatient> {
  TextEditingController nationalIDcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool isOn = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.1,
          right: width * 0.05,
          left: width * 0.05,
        ),
        child: SingleChildScrollView(
          child: Column(
            spacing: height * 0.03,
            children: [
              Image.asset(
                "assets/image/Your voice builds better care (2) 1.png",
                height: height * 0.205,
              ),
              Text(
                textAlign: TextAlign.center,
                "Create an account",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 0),

              CustomTextField(
                validator: (value) {},
                controller: nationalIDcontroller,
                hintText: "enter your national id",
                labelText: "National id",
              ),
              CustomTextField(
                validator: (value) {},
                controller: passwordcontroller,
                hintText: "enter your password",
                labelText: "Password",
                obscureText: true,
                passwordTextIcon: true,
              ),

              SizedBox(height: height * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePatient()),
                    );
                  },
                  child: ButtonWidget(
                    height: height,
                    width: width,
                    text: "Sign Up",
                    color: Color(0XFF0D6EFD),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Back to ",
                    style: TextStyle(
                      fontFamily: "Poppins",

                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPatient()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        decorationColor: Colors.grey,
                        fontWeight: FontWeight.w500,
                        color: Color(0XFF0D6EFD),
                        fontSize: width * 0.045,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
