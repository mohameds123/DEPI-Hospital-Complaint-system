import 'package:depi_hospital_complaint_system/Data/complaint_model.dart';
import 'package:depi_hospital_complaint_system/Logic/new_complaint/cubit.dart';
import 'package:depi_hospital_complaint_system/Logic/new_complaint/state.dart';

import 'package:depi_hospital_complaint_system/Ui/widgets/attachment_Box.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/radio_button_widget.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/submit_button.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPatientComplaint extends StatefulWidget {
  String username;
  String id;
  String hospitalId;
  String department;

  NewPatientComplaint({
    super.key,
    required this.username,
    required this.id,
    required this.hospitalId,
    required this.department,
  });

  @override
  State<NewPatientComplaint> createState() => _NewPatientComplaintState();
}

class _NewPatientComplaintState extends State<NewPatientComplaint> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  String? selectedSubmission = 'Complaint';
  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewComplaintCubit(),
      child: BlocConsumer<NewComplaintCubit, NewComplaintState>(
        listener: (context, state) {
          if (state is NewComplaintSuccessState) {
            print('send done');
          } else if (state is NewComplaintErrorState) {
            print(state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 65),
                  // type of submission
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Type of Submission',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SizedBox(height: 8),
                  // complaint
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSubmission = 'Complaint';
                      });
                    },
                    child: CustomRadioButton(
                      selectedValue: selectedSubmission,
                      value: 'Complaint',
                    ),
                  ),
                  SizedBox(height: 16),
                  // request
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSubmission = 'Request';
                      });
                    },
                    child: CustomRadioButton(
                      selectedValue: selectedSubmission,
                      value: 'Request',
                    ),
                  ),
                  SizedBox(height: 16),
                  // suggestion
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedSubmission = 'Suggestion';
                      });
                    },
                    child: CustomRadioButton(
                      selectedValue: selectedSubmission,
                      value: 'Suggestion',
                    ),
                  ),
                  SizedBox(height: 22),

                  //  Title
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter $selectedSubmission title';
                      }
                      return null;
                    },
                    controller: titleController,
                    hintText: 'enter your $selectedSubmission title',
                    labelText: '$selectedSubmission Title',
                  ),
                  SizedBox(height: 22),
                  // Description
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Description';
                      }
                      return null;
                    },
                    controller: descriptionController,
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
                  SubmitButton(
                    onTap: () {
                      context.read<NewComplaintCubit>().newComplaint(
                        complaint: ComplaintModel(
                          jobTitle: 'Patient',
                          hospitalId: int.parse(widget.hospitalId),
                          category: selectedSubmission!,
                          department: widget.department,
                          description: descriptionController.text,
                          title: titleController.text,
                          attachmentUrl: '',
                        ),
                      );
                    },

                    reporttype: '$selectedSubmission',
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
