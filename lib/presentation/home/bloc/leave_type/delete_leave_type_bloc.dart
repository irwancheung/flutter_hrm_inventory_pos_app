import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/leave_type_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_leave_type_bloc.freezed.dart';
part 'delete_leave_type_event.dart';
part 'delete_leave_type_state.dart';

class DeleteLeaveTypeBloc extends Bloc<DeleteLeaveTypeEvent, DeleteLeaveTypeState> {
  final LeaveTypeRemoteDataSource _leaveTypeRemoteDataSource;

  DeleteLeaveTypeBloc(this._leaveTypeRemoteDataSource) : super(const _Initial()) {
    on<_DeleteLeaveType>((event, emit) async {
      emit(const _Loading());

      final result = await _leaveTypeRemoteDataSource.deleteLeaveType(event.id);

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
