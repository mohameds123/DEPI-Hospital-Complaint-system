import 'package:depi_hospital_complaint_system/Data/hospital_model.dart';

class GetHospitalListState {}

class GetHospitalListInitialState extends GetHospitalListState {}

class GetHospitalListLoadingState extends GetHospitalListState {}

class GetHospitalListSuccessState extends GetHospitalListState {
  List<HospitalModel> hospitals;
  GetHospitalListSuccessState(this.hospitals);
}

class GetHospitalListErrorState extends GetHospitalListState {
  String errorMessage;
  GetHospitalListErrorState(this.errorMessage);
}
