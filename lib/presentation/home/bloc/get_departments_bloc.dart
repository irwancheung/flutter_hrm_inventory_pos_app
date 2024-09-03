import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/department_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/department_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_departments_bloc.freezed.dart';
part 'get_departments_event.dart';
part 'get_departments_state.dart';

class GetDepartmentsBloc extends Bloc<GetDepartmentsEvent, GetDepartmentsState> {
  final DepartmentRemoteDataSource _departmentRemoteDataSource;
  GetDepartmentsBloc(this._departmentRemoteDataSource) : super(const _Initial()) {
    on<_GetDepartments>((event, emit) async {
      emit(const _Loading());

      final result = await _departmentRemoteDataSource.getDepartments();

      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r.departments!)));
    });
  }
}
