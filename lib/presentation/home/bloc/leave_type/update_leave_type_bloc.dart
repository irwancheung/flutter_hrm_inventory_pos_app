import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/leave_type_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_leave_type_bloc.freezed.dart';
part 'update_leave_type_event.dart';
part 'update_leave_type_state.dart';

class UpdateLeaveTypeBloc extends Bloc<UpdateLeaveTypeEvent, UpdateLeaveTypeState> {
  final LeaveTypeRemoteDataSource _leaveTypeRemoteDataSource;

  UpdateLeaveTypeBloc(this._leaveTypeRemoteDataSource) : super(const _Initial()) {
    on<_UpdateLeaveType>((event, emit) async {
      emit(const _Loading());

      final result = await _leaveTypeRemoteDataSource.updateLeaveType(
        id: event.id,
        name: event.name,
        isPaid: event.isPaid,
        totalLeave: event.totalLeave,
        maxLeavePerMonth: event.maxLeavePerMonth,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
