import 'package:depi_hospital_complaint_system/Ui/screens/home_patient.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/new_complain.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/onboarding/onboarding1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff25C2A0)),
      ),
      home: Onboarding1(),
    );
  }
}
