import 'dart:ffi';

import 'package:depi_hospital_complaint_system/Data/complaint_model.dart';
import 'package:depi_hospital_complaint_system/Logic/new_complaint/cubit.dart';
import 'package:depi_hospital_complaint_system/Logic/new_complaint/state.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/attachment_Box.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/radio_button_widget.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/submit_button.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffRequestSubmit extends StatefulWidget {
  String username;
  String id;
  String hospitalId;
  String department;
  String jobTitle;
  String complainType;
  StaffRequestSubmit({
    super.key,
    required this.username,
    required this.id,
    required this.hospitalId,
    required this.department,
    required this.jobTitle,
    required this.complainType,
  });

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
                  // priority
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Priority',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your request title';
                      }
                      return null;
                    },
                    controller: requestTitleController,
                    hintText: 'enter your request title',
                    labelText: 'Request Title',
                  ),
                  SizedBox(height: 22),
                  // Description
                  CustomTextField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Description';
                      }
                      return null;
                    },
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
                  SubmitButton(
                    onTap: () {
                      context.read<NewComplaintCubit>().newComplaint(
                        complaint: ComplaintModel(
                          title: requestTitleController.text,
                          hospitalId: int.parse(widget.hospitalId),
                          department: widget.department,
                          jobTitle: widget.jobTitle,
                          category:
                              '${widget.complainType} Priority: $selectedPriority',
                          description: requestDescriptionController.text,
                          attachmentUrl: '',
                        ),
                      );
                    },
                    reporttype: 'request',
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
