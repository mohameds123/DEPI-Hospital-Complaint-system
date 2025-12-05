import 'package:depi_hospital_complaint_system/Data/login_model.dart';
import 'package:depi_hospital_complaint_system/Logic/Login/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  String? userToken;
  String? userName;
  final Dio dio = Dio();
  LoginCubit() : super(LoginInitailState());

  // function to Login
  Future login({required LoginModel loginModel}) async {
    emit(LoginLoadingState());
    try {
      final response = await dio.post(
        "https://h-c-m-system.azurewebsites.net/login",
        data: loginModel.toJson(),
      );

      if (response.statusCode == 200) {
        emit(LoginSucessState());
      }
    } catch (e) {
      emit(LoginErrorState(errorMessage: e.toString()));
    }
  }
}
