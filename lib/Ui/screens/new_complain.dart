import 'package:depi_hospital_complaint_system/Ui/screens/patient/new_patient_complain.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/staff/new_staff_complain.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class NewComplainScreen extends StatefulWidget {
  const NewComplainScreen({super.key});

  @override
  State<NewComplainScreen> createState() => _NewComplainScreenState();
}

class _NewComplainScreenState extends State<NewComplainScreen> {
  String? selectedRole;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),

            // Logo
            Image.asset(
              'assets/image/Your voice builds better care (2) 1.png',
              height: 190, // your logo here
            ),

            const Text(
              'New Complain',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),

            const SizedBox(height: 30),

            // UserType
            DropdownButtonFormField<String>(
              dropdownColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: selectedRole == null
                    ? Colors.white
                    : Color(0xffE8E9EB),
                labelText: 'UserType',
                hintText: 'enter your Role',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xff79747E)),
                  borderRadius: BorderRadius.circular(6),
                ),
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              initialValue: selectedRole,
              items: const [
                DropdownMenuItem(value: 'Patient', child: Text('Patient')),
                DropdownMenuItem(value: 'Staff', child: Text('Staff')),
              ],
              onChanged: (value) {
                setState(() {
                  selectedRole = value;
                });
              },
            ),

            const SizedBox(height: 29),
            // Username
            CustomTextField(
              controller: usernameController,
              labelText: 'Username',
              hintText: 'enter your username',
            ),

            const SizedBox(height: 29),
            // ID
            CustomTextField(
              controller: idController,
              labelText: 'ID',
              hintText: 'enter your ID',
            ),
            const SizedBox(height: 29),
            // Hospital Name
            CustomTextField(
              controller: hospitalNameController,
              labelText: 'Hospital Name',
              hintText: 'enter Hospital name',
            ),
            const SizedBox(height: 29),
            // Department
            CustomTextField(
              controller: departmentController,
              labelText: 'Department',
              hintText: 'enter the department',
            ),
            const SizedBox(height: 37),

            // Submit Button
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  if (selectedRole == 'Staff') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewStaffComplain(),
                      ),
                    );
                  } else if (selectedRole == 'Patient') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPatientComplain(),
                      ),
                    );
                  }
                },
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(color: Color(0xff0D6EFD)),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
