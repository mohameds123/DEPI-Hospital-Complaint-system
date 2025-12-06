import 'package:depi_hospital_complaint_system/Core/api_paths.dart';
import 'package:depi_hospital_complaint_system/Data/login_model.dart';
import 'package:depi_hospital_complaint_system/Logic/Login/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitailState());

  final Dio dio = Dio();

  // function to Login
  Future login({required LoginModel loginModel}) async {
    emit(LoginLoadingState());
    try {
      final response = await dio.post(
        ApiPaths.login,
        data: loginModel.toJson(),
      );

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('role', response.data['role']);

        emit(LoginSucessState());
      }
    } catch (e) {
      emit(LoginErrorState(errorMessage: e.toString()));
    }
  }
}
