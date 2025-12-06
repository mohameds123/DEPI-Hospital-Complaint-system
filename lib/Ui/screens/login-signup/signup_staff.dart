import 'package:depi_hospital_complaint_system/Data/sign_up_model.dart';
import 'package:depi_hospital_complaint_system/Logic/signup/cubit.dart';
import 'package:depi_hospital_complaint_system/Logic/signup/state.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/home.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/button_widget.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpStaff extends StatefulWidget {
  const SignUpStaff({super.key});

  @override
  State<SignUpStaff> createState() => _SignUpStaffState();
}

class _SignUpStaffState extends State<SignUpStaff> {
  TextEditingController workEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  bool isOn = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpSucessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Success Sign Up"),
                backgroundColor: Color(0XFF0D6EFD),
              ),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Home()),
              (route) => false,
            );
          } else if (state is SignUpErrorState) {
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
                      "Create an account",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 0),

                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your work email";
                        }
                        return null;
                      },
                      controller: workEmailController,
                      hintText: "enter your work email",
                      labelText: "Work Email",
                    ),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                      controller: passwordController,
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
                          context.read<SignUpCubit>().signUp(
                            signUpModel: SignUpModel(
                              email: workEmailController.text,
                              password: passwordController.text,
                              role: 'staff',
                            ),
                          );
                        },
                        child: ButtonWidget(
                          height: height,
                          width: width,
                          text: "Sign Up",
                          color: Color(0XFF0D6EFD),
                          loadingState: state is SignUpLoadingState,
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
                            Navigator.pop(context);
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
        },
      ),
    );
  }
}
