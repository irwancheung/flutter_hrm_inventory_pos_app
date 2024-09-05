import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/department_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_department_bloc.freezed.dart';
part 'update_department_event.dart';
part 'update_department_state.dart';

class UpdateDepartmentBloc extends Bloc<UpdateDepartmentEvent, UpdateDepartmentState> {
  final DepartmentRemoteDataSource _departmentRemoteDataSource;
  UpdateDepartmentBloc(this._departmentRemoteDataSource) : super(const _Initial()) {
    on<_UpdateDepartment>((event, emit) async {
      emit(const _Loading());

      final result = await _departmentRemoteDataSource.updateDepartment(
        id: event.id,
        name: event.name,
        description: event.description,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
