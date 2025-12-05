import 'package:depi_hospital_complaint_system/Data/login_model.dart';
import 'package:depi_hospital_complaint_system/Logic/Login/cubit.dart';
import 'package:depi_hospital_complaint_system/Logic/Login/state.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/home_patient.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/button_widget.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginStaff extends StatefulWidget {
  const LoginStaff({super.key});

  @override
  State<LoginStaff> createState() => _LoginStaffState();
}

class _LoginStaffState extends State<LoginStaff> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isChecked = false;
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
              MaterialPageRoute(builder: (context) => HomePatient()),
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
              child: Column(
                spacing: height * 0.03,
                children: [
                  Image.asset(
                    "assets/image/Your voice builds better care (2) 1.png",
                    height: height * 0.205,
                  ),
                  Text(
                    "Staff Access Portal",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: width * 0.06,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 32,
                        width: 32,
                        child: Checkbox(
                          activeColor: Color(0XFF0D6EFD),
                          side: BorderSide(
                            color: Colors.black,
                            width: width * 0.006,
                          ),
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
                        context.read<LoginCubit>().login(
                          loginModel: LoginModel(
                            email: emailcontroller.text,
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
