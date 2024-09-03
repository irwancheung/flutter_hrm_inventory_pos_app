import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/department_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_department_bloc.freezed.dart';
part 'delete_department_event.dart';
part 'delete_department_state.dart';

class DeleteDepartmentBloc extends Bloc<DeleteDepartmentEvent, DeleteDepartmentState> {
  final DepartmentRemoteDataSource _departmentRemoteDataSource;
  DeleteDepartmentBloc(this._departmentRemoteDataSource) : super(const _Initial()) {
    on<_DeleteDepartment>((event, emit) async {
      emit(const _Loading());

      final result = await _departmentRemoteDataSource.deleteDepartment(event.id);

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
