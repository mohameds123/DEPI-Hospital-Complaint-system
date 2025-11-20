import 'package:depi_hospital_complaint_system/Ui/screens/home_patient.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/button_widget.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController codecontroller = TextEditingController();

  bool isChecked = false;
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
            Text(
              "Administrator Console",
              style: TextStyle(fontSize: width * 0.06),
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
            CustomTextField(
              controller: codecontroller,
              hintText: "enter your code",
              labelText: "Code",
            ),
            Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Checkbox(
                    activeColor: Color(0XFF0D6EFD),
                    side: BorderSide(color: Colors.black, width: width * 0.006),
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
                Text(
                  "Remember Me",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forget Password?",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
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
