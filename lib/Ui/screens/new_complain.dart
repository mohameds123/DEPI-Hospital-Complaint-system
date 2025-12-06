import 'package:depi_hospital_complaint_system/Logic/Hospital_list/cubit.dart';
import 'package:depi_hospital_complaint_system/Logic/Hospital_list/state.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/patient/new_patient_complain.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/staff/new_staff_complain.dart';
import 'package:depi_hospital_complaint_system/Ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewComplaintScreen extends StatefulWidget {
  String? role;
  String? iD;
  NewComplaintScreen({super.key, required this.role, required this.iD});

  @override
  State<NewComplaintScreen> createState() => _NewComplaintScreenState();
}

class _NewComplaintScreenState extends State<NewComplaintScreen> {
  String? selectedRole;
  String? selectedHospital;
  String? hospitalId;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController hospitalNameController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  initState() {
    idController.text = widget.iD!;
    selectedRole = widget.role;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetHospitalListCubit()..getHospitalList(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: formkey,
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
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xff79747E),
                      ),
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
                    DropdownMenuItem(
                      value: 'patient',
                      child: Text(
                        'Patient',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'staff',
                      child: Text(
                        'Staff',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                  onChanged: null,
                ),

                const SizedBox(height: 29),
                // Username
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  controller: usernameController,
                  labelText: 'Username',
                  hintText: 'enter your username',
                ),

                const SizedBox(height: 29),
                // ID
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your ID';
                    }
                    return null;
                  },
                  readonly: true,
                  controller: idController,
                  labelText: 'National ID',
                  hintText: 'enter your National ID',
                ),
                const SizedBox(height: 29),
                // Hospital Name
                // CustomTextField(
                //   controller: hospitalNameController,
                //   labelText: 'Hospital Name',
                //   hintText: 'enter Hospital name',
                // ),
                BlocBuilder<GetHospitalListCubit, GetHospitalListState>(
                  builder: (context, state) {
                    if (state is GetHospitalListSuccessState) {
                      return DropdownButtonFormField<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a hospital';
                          }
                          return null;
                        },
                        dropdownColor: Colors.white,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: selectedHospital == null
                              ? Colors.white
                              : Color(0xffE8E9EB),
                          labelText: 'Hospital Name',
                          hintText: 'Choose Hospital',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: Color(0xff79747E),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
                          ),
                        ),
                        initialValue: selectedHospital,
                        // we will get the value from the api and put it here
                        items: state.hospitals
                            .map(
                              (e) => DropdownMenuItem(
                                value: e.id.toString(),
                                child: Text(e.name),
                              ),
                            )
                            .toList(),

                        onChanged: (value) {
                          setState(() {
                            hospitalId = value;
                          });
                        },
                      );
                    }
                    return DropdownButtonFormField<String>(
                      dropdownColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: selectedHospital == null
                            ? Colors.white
                            : Color(0xffE8E9EB),
                        labelText: 'Hospital Name',
                        hintText: 'Choose Hospital',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xff79747E),
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                      initialValue: selectedHospital,

                      items: [],

                      onChanged: (value) {
                        setState(() {
                          selectedHospital = value;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 29),
                // Department
                CustomTextField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the department';
                    }
                    return null;
                  },
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
                      if (selectedRole == 'staff' &&
                          formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewStaffComplaint(
                              username: usernameController.text,
                              id: idController.text,
                              hospitalId: hospitalId!,
                              department: departmentController.text,
                            ),
                          ),
                        );
                      } else if (selectedRole == 'patient' &&
                          formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewPatientComplaint(
                              username: usernameController.text,
                              id: idController.text,
                              hospitalId: hospitalId!,
                              department: departmentController.text,
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
      ),
    );
  }
}
