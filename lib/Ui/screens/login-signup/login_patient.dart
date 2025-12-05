import 'package:depi_hospital_complaint_system/Data/login_model.dart';
import 'package:depi_hospital_complaint_system/Logic/Login/cubit.dart';
import 'package:depi_hospital_complaint_system/Logic/Login/state.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/home.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/login-signup/signup_patient.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/button_widget.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPatient extends StatefulWidget {
  const LoginPatient({super.key});

  @override
  State<LoginPatient> createState() => _LoginPatientState();
}

class _LoginPatientState extends State<LoginPatient> {
  TextEditingController nationalIDcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isOn = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSucessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Success Login"),
                backgroundColor: Color(0XFF0D6EFD),
              ),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false,
            );
          } else if (state is LoginErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
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
                      controller: nationalIDcontroller,
                      hintText: "enter your national id",
                      labelText: "National id",
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
                          context.read<LoginCubit>().login(
                            loginModel: LoginModel(
                              email: nationalIDcontroller.text,
                              password: passwordcontroller.text,
                            ),
                          );
                        },
                        child: ButtonWidget(
                          height: height,
                          width: width,
                          text: "Login",
                          color: Color(0XFF0D6EFD),
                          loadingState: state is LoginLoadingState,
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
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
                              MaterialPageRoute(
                                builder: (context) => SignUpPatient(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
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
        },
      ),
    );
  }
}
