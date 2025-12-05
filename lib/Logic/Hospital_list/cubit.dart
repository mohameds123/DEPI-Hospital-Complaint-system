import 'package:depi_hospital_complaint_system/Core/api_paths.dart';
import 'package:depi_hospital_complaint_system/Data/hospital_model.dart';
import 'package:depi_hospital_complaint_system/Logic/Hospital_list/state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetHospitalListCubit extends Cubit<GetHospitalListState> {
  GetHospitalListCubit() : super(GetHospitalListInitialState());

  Future getHospitalList() async {
    emit(GetHospitalListLoadingState());

    Dio dio = Dio();

    try {
      final response = await dio.get(ApiPaths.getHospitalList);

      final data = HospitalModel.fromList(response.data);

      if (response.statusCode == 200) {
        emit(GetHospitalListSuccessState(data));
      }
    } catch (e) {
      emit(GetHospitalListErrorState(e.toString()));
    }
  }
}
