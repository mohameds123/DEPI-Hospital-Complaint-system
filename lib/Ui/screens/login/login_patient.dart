import 'package:depi_hospital_complaint_system/Ui/screens/home_patient.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/button_widget.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';

import 'package:flutter/material.dart';

class LoginPatient extends StatefulWidget {
  const LoginPatient({super.key});

  @override
  State<LoginPatient> createState() => _LoginPatientState();
}

class _LoginPatientState extends State<LoginPatient> {
  TextEditingController emailcontroller = TextEditingController();
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
                "Welcome Back\nLets continue\nyour care journey",
                style: TextStyle(
                  height: 1.1,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 0),
              CustomTextField(
                controller: emailcontroller,
                hintText: "enter your email",
                labelText: "Work Email",
              ),
              CustomTextField(
                controller: passwordcontroller,
                hintText: "enter your password",
                labelText: "Password",
                obscureText: true,
                passwordTextIcon: true,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Continue as Anonymous",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Transform.scale(
                    scale: width * 0.0017,
                    child: SizedBox(
                      width: width * 0.12,
                      height: height * 0.04,
                      child: Switch(
                        activeColor: Colors.white,
                        inactiveThumbColor: Colors.white,
                        activeTrackColor: Color(0xff25C2A0),
                        inactiveTrackColor: Colors.grey,

                        value: isOn,
                        onChanged: (value) {
                          setState(() {
                            isOn = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.grey,
                    color: Colors.grey,
                    fontSize: width * 0.04,
                  ),
                ),
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
                    text: "Login",
                    color: Color(0XFF0D6EFD),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
