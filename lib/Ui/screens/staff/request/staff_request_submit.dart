import 'package:depi_hospital_complaint_system/Ui/widgets/attachment_Box.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/radio_button_widget.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/submit_button.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class StaffRequestSubmit extends StatefulWidget {
  const StaffRequestSubmit({super.key});

  @override
  State<StaffRequestSubmit> createState() => _StaffRequestSubmitState();
}

class _StaffRequestSubmitState extends State<StaffRequestSubmit> {
  TextEditingController requestTitleController = TextEditingController();
  TextEditingController requestDescriptionController = TextEditingController();

  String? selectedPriority;
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
            SizedBox(height: 65),
            // priority
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Priority',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),

            SizedBox(height: 8),
            // priority high
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPriority = 'High';
                });
              },
              child: CustomRadioButton(
                selectedValue: selectedPriority,
                value: 'High',
              ),
            ),
            SizedBox(height: 16),
            // priority medium
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPriority = 'Medium';
                });
              },
              child: CustomRadioButton(
                selectedValue: selectedPriority,
                value: 'Medium',
              ),
            ),
            SizedBox(height: 16),
            // priority low
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedPriority = 'Low';
                });
              },
              child: CustomRadioButton(
                selectedValue: selectedPriority,
                value: 'Low',
              ),
            ),
            SizedBox(height: 22),

            // Request Title
            CustomTextField(
              validator: (value) {},
              controller: requestTitleController,
              hintText: 'enter your request title',
              labelText: 'Request Title',
            ),
            SizedBox(height: 22),
            // Description
            CustomTextField(
              validator: (value) {},
              controller: requestDescriptionController,
              hintText: 'enter your Description',
              labelText: 'Description',
            ),
            SizedBox(height: 22),
            AttachmentBox(),
            SizedBox(height: 22),
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

            // Submit Request
            SubmitButton(reporttype: 'request'),
          ],
        ),
      ),
    );
  }
}
