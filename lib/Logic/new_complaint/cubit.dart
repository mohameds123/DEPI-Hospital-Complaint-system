import 'package:depi_hospital_complaint_system/Core/api_paths.dart';
import 'package:depi_hospital_complaint_system/Data/complaint_model.dart';
import 'package:depi_hospital_complaint_system/Logic/new_complaint/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewComplaintCubit extends Cubit<NewComplaintState> {
  NewComplaintCubit() : super(NewComplaintState());

  Future newComplaint({required ComplaintModel complaint}) async {
    emit(NewComplaintLoadingState());
    Dio dio = Dio();

    try {
      final response = await dio.post(
        ApiPaths.newcomplaint,
        data: complaint,
        options: Options(
          headers: {
            'accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(NewComplaintSuccessState());
      }
    } catch (e) {
      emit(NewComplaintErrorState(e.toString()));
    }
  }
}
