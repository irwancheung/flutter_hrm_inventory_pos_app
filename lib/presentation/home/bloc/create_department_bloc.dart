import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/department_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_department_bloc.freezed.dart';
part 'create_department_event.dart';
part 'create_department_state.dart';

class CreateDepartmentBloc extends Bloc<CreateDepartmentEvent, CreateDepartmentState> {
  final DepartmentRemoteDataSource _departmentRemoteDataSource;

  CreateDepartmentBloc(this._departmentRemoteDataSource) : super(const _Initial()) {
    on<_CreateDepartment>((event, emit) async {
      emit(const _Loading());

      final result = await _departmentRemoteDataSource.createDepartment(
        name: event.name,
        description: event.description,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
