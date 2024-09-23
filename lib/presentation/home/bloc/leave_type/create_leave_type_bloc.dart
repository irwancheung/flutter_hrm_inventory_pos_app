import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/leave_type_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_leave_type_bloc.freezed.dart';
part 'create_leave_type_event.dart';
part 'create_leave_type_state.dart';

class CreateLeaveTypeBloc extends Bloc<CreateLeaveTypeEvent, CreateLeaveTypeState> {
  final LeaveTypeRemoteDataSource _leaveTypeRemoteDataSource;
  CreateLeaveTypeBloc(this._leaveTypeRemoteDataSource) : super(const _Initial()) {
    on<_CreateLeaveType>((event, emit) async {
      emit(const _Loading());

      final result = await _leaveTypeRemoteDataSource.createLeaveType(
        name: event.name,
        isPaid: event.isPaid,
        totalLeaves: event.totalLeaves,
        maxLeavePerMonth: event.maxLeavePerMonth,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
