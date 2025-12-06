import 'package:depi_hospital_complaint_system/Data/reports_model.dart';

class HomeState {}

class HomeInitailState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSucessState extends HomeState {
  ReportsResponse reportsResponse;

  HomeSucessState({required this.reportsResponse});
}

class HomeErrorState extends HomeState {
  String error;
  HomeErrorState({required this.error});
}
