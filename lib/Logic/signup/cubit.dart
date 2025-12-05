import 'package:depi_hospital_complaint_system/Data/login_model.dart';
import 'package:depi_hospital_complaint_system/Data/sign_up_model.dart';
import 'package:depi_hospital_complaint_system/Logic/Login/state.dart';
import 'package:depi_hospital_complaint_system/Logic/signup/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  String? userToken;
  String? userName;
  final Dio dio = Dio();
  SignUpCubit() : super(SignUpInitailState());

  // function to SignUp
  Future signUp({required SignUpModel signUpModel}) async {
    emit(SignUpLoadingState());
    try {
      final response = await dio.post(
        "https://h-c-m-system.azurewebsites.net/register",
        data: signUpModel.toJson(),
      );

      if (response.statusCode == 200) {
        emit(SignUpSucessState());
      }
    } catch (e) {
      emit(SignUpErrorState(errorMessage: e.toString()));
    }
  }
}
