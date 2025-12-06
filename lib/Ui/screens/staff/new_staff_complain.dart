import 'package:depi_hospital_complaint_system/Ui/screens/staff/complaintAndsuggestion/staff_complain_submit.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/staff/request/staff_request_submit.dart';

import 'package:depi_hospital_complaint_system/Ui/widgets/radio_button_widget.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class NewStaffComplaint extends StatefulWidget {
  String username;
  String id;
  String hospitalId;
  String department;
  NewStaffComplaint({
    super.key,
    required this.username,
    required this.id,
    required this.hospitalId,
    required this.department,
  });

  @override
  State<NewStaffComplaint> createState() => _NewStaffComplaintState();
}

class _NewStaffComplaintState extends State<NewStaffComplaint> {
  final TextEditingController jobtitleController = TextEditingController();

  final TextEditingController idController = TextEditingController();

  final TextEditingController hospitalNameController = TextEditingController();

  final TextEditingController departmentController = TextEditingController();

  String? selectedSubmission;

  String? selectedCategory;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/image/Your voice builds better care (2) 1.png',
                height: 190, // your logo here
              ),
              const Text(
                'New Complain',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 32),
              // job title
              CustomTextField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your job title';
                  }
                  return null;
                },
                controller: jobtitleController,
                hintText: 'enter your job title',
                labelText: 'Job title',
              ),

              SizedBox(height: 16),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Type of Submission',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 8),
              // Type of Submission

              // Complaint
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSubmission = 'Complaint';
                    selectedCategory = null;
                  });
                },
                child: CustomRadioButton(
                  selectedValue: selectedSubmission,
                  value: 'Complaint',
                ),
              ),

              SizedBox(height: 16),
              // Request
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSubmission = 'Request';
                    selectedCategory = null;
                  });
                },
                child: CustomRadioButton(
                  selectedValue: selectedSubmission,
                  value: 'Request',
                ),
              ),
              SizedBox(height: 16),
              // Suggestion
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSubmission = 'Suggestion';
                    selectedCategory = null;
                  });
                },
                child: CustomRadioButton(
                  selectedValue: selectedSubmission,
                  value: 'Suggestion',
                ),
              ),
              SizedBox(height: 16),
              // Complain category removed ;-;
              // DropdownButtonFormField<String>(
              //   dropdownColor: Colors.white,
              //   decoration: InputDecoration(
              //     labelText: 'Compain category',
              //     hintText: 'enter your Complain',
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(6),
              //     ),
              //     isDense: true,
              //     contentPadding: const EdgeInsets.symmetric(
              //       horizontal: 12,
              //       vertical: 14,
              //     ),
              //   ),
              //   value: selectedCategory,
              //   items: [
              //     if (selectedSubmission == 'Complaint') ...[
              //       DropdownMenuItem(
              //         value: 'Administrative',
              //         child: Text('Administrative'),
              //       ),

              //       DropdownMenuItem(value: 'Service', child: Text('Service')),
              //       DropdownMenuItem(value: 'Staff', child: Text('Staff')),
              //       DropdownMenuItem(value: 'other', child: Text('other')),
              //     ] else if (selectedSubmission == 'Request') ...[
              //       DropdownMenuItem(
              //         value: 'Maintenance',
              //         child: Text('Maintenance'),
              //       ),
              //       DropdownMenuItem(value: 'Supplies', child: Text('Supplies')),
              //       DropdownMenuItem(
              //         value: 'IT Support',
              //         child: Text('IT Support'),
              //       ),
              //       DropdownMenuItem(value: 'other', child: Text('other')),
              //     ] else if (selectedSubmission == "Suggestion") ...[
              //       DropdownMenuItem(
              //         value: 'Work flow ',
              //         child: Text('Work flow '),
              //       ),

              //       DropdownMenuItem(
              //         value: ' Efficiency',
              //         child: Text(' Efficiency'),
              //       ),
              //       DropdownMenuItem(value: 'Safety', child: Text('Safety')),
              //       DropdownMenuItem(value: 'other', child: Text('other')),
              //     ],
              //   ],
              //   onChanged: (value) {
              //     setState(() {
              //       selectedCategory = value;
              //     });
              //   },
              // ),
              const SizedBox(height: 37),
              // Submit Button
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    if (selectedSubmission == 'Complaint' &&
                        formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StaffComplainAndSuggestionSubmit(
                                jobTitle: jobtitleController.text,
                                id: widget.id,
                                department: widget.department,
                                hospitalId: widget.hospitalId,
                                username: widget.username,

                                complainType: 'Complaint',
                              ),
                        ),
                      );
                    } else if (selectedSubmission == 'Request' &&
                        formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StaffRequestSubmit(
                            jobTitle: jobtitleController.text,
                            id: widget.id,
                            department: widget.department,
                            hospitalId: widget.hospitalId,
                            username: widget.username,
                            complainType: 'Request',
                          ),
                        ),
                      );
                    } else if (selectedSubmission == 'Suggestion' &&
                        formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StaffComplainAndSuggestionSubmit(
                                jobTitle: jobtitleController.text,
                                id: widget.id,
                                department: widget.department,
                                hospitalId: widget.hospitalId,
                                username: widget.username,
                                complainType: 'Suggestion',
                              ),
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
      ),
    );
  }
}
