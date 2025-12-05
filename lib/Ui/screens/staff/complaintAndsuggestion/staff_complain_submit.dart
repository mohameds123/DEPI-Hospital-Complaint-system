import 'package:depi_hospital_complaint_system/Data/complaint_model.dart';
import 'package:depi_hospital_complaint_system/Logic/new_complaint/cubit.dart';
import 'package:depi_hospital_complaint_system/Logic/new_complaint/state.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/attachment_Box.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/submit_button.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffComplainAndSuggestionSubmit extends StatefulWidget {
  String username;
  String id;
  String hospitalId;
  String department;
  String jobTitle;
  String complainType;

  StaffComplainAndSuggestionSubmit({
    super.key,
    required this.complainType,
    required this.username,
    required this.id,
    required this.hospitalId,
    required this.department,
    required this.jobTitle,
  });

  @override
  State<StaffComplainAndSuggestionSubmit> createState() =>
      _StaffComplainAndSuggestionSubmitState();
}

class _StaffComplainAndSuggestionSubmitState
    extends State<StaffComplainAndSuggestionSubmit> {
  TextEditingController Titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

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
                  SizedBox(height: 100),
                  // Logo
                  Image.asset(
                    'assets/image/Your voice builds better care (2) 1.png',
                    height: 190, // your logo here
                  ),
                  Text(
                    'New ${widget.complainType}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 30),
                  // Complain Title
                  CustomTextField(
                    validator: (value) {},
                    controller: Titlecontroller,
                    hintText: 'enter your ${widget.complainType} title',
                    labelText: '${widget.complainType} Title',
                  ),
                  SizedBox(height: 16),
                  // Description
                  CustomTextField(
                    validator: (value) {},
                    controller: descriptioncontroller,
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

                  SubmitButton(
                    onTap: () {
                      context.read<NewComplaintCubit>().newComplaint(
                        complaint: ComplaintModel(
                          hospitalId: int.parse(widget.hospitalId),
                          title: Titlecontroller.text,
                          category: widget.complainType,
                          department: widget.department,
                          description: descriptioncontroller.text,
                          jobTitle: widget.jobTitle,
                          attachmentUrl: '',
                        ),
                      );
                    },
                    reporttype: widget.complainType,
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
