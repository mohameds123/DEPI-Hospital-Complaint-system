import 'package:depi_hospital_complaint_system/Ui/widgets/attachment_Box.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/submit_button.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class StaffSuggestionSubmit extends StatefulWidget {
  const StaffSuggestionSubmit({super.key});

  @override
  State<StaffSuggestionSubmit> createState() => _StaffSuggestionSubmitState();
}

class _StaffSuggestionSubmitState extends State<StaffSuggestionSubmit> {
  TextEditingController sugguestionTitlecontroller = TextEditingController();
  TextEditingController sugguestiondescriptioncontroller =
      TextEditingController();

  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            // Logo
            Image.asset(
              'assets/image/Your voice builds better care (2) 1.png',
              height: 190, // your logo here
            ),
            const Text(
              'New Complain',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 30),
            // Suggestion Title
            CustomTextField(
              controller: sugguestionTitlecontroller,
              hintText: 'enter your Suggestion title',
              labelText: 'Suggestion Title',
            ),
            SizedBox(height: 16),
            // Description
            CustomTextField(
              controller: sugguestiondescriptioncontroller,
              hintText: 'enter your Description',
              labelText: 'Description',
            ),
            SizedBox(height: 21),

            // Upload box
            AttachmentBox(),
            SizedBox(height: 10),
            // Continue as Anonymous
            Row(
              children: [
                Text(
                  'Continue as Anonymous',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6C757D),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: 32,
                  height: 18,
                  child: Transform.scale(
                    scale: 0.5,
                    child: Switch(
                      activeTrackColor: Color(0xff25C2A0),
                      value: isAnonymous,
                      onChanged: (value) {
                        setState(() {
                          isAnonymous = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 37),

            SubmitButton(reporttype: 'sugguestion'),
          ],
        ),
      ),
    );
  }
}
