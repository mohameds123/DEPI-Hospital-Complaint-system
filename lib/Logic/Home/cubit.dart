import 'package:depi_hospital_complaint_system/Core/api_paths.dart';
import 'package:depi_hospital_complaint_system/Data/reports_model.dart';
import 'package:depi_hospital_complaint_system/Logic/Home/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitailState());

  Dio dio = Dio();

  Future gethomedata() async {
    final response = await dio.get(ApiPaths.gethomedata);

    final data = ReportsResponse.fromJson(response.data);

    if (response.statusCode == 200) {
      emit(HomeSucessState(reportsResponse: data));
    }
  }
}
