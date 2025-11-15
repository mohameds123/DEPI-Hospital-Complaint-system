import 'package:depi_hospital_complaint_system/Ui/screens/home_patient.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/login/login_staff.dart';
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
      body: Padding(
        padding: EdgeInsets.only(
          top: height * 0.1,
          right: width * 0.05,
          left: width * 0.05,
        ),
        child: Column(
          spacing: height * 0.03,
          children: [
            Image.asset(
              "assets/image/Your voice builds better care (2) 1.png",
              height: height * 0.205,
            ),
            Column(
              children: [
                Text("Welcome Back", style: TextStyle(fontSize: width * 0.06)),
                Text("Lets continue", style: TextStyle(fontSize: width * 0.06)),
                Text(
                  "your care journey",
                  style: TextStyle(fontSize: width * 0.06),
                ),
              ],
            ),
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
            // Row(
            //   children: [
            //     Checkbox(
            //       activeColor: Color(0XFF0D6EFD),
            //       side: BorderSide(color: Colors.black, width: 2),
            //       value: isChecked,
            //       onChanged: (value) {
            //         setState(() {
            //           isChecked = value!;
            //         });
            //       },
            //     ),
            //     Text("Remember Me", style: TextStyle(color: Colors.grey)),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Continue as Anonymous",
                  style: TextStyle(color: Colors.grey, fontSize: width * 0.05),
                ),
                Transform.scale(
                  scale: width * 0.0017,
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
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.4),
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
    );
  }
}
