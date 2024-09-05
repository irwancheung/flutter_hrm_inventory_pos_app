import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/leave_type_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/leave_type_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_leave_types_bloc.freezed.dart';
part 'get_leave_types_event.dart';
part 'get_leave_types_state.dart';

class GetLeaveTypesBloc extends Bloc<GetLeaveTypesEvent, GetLeaveTypesState> {
  final LeaveTypeRemoteDataSource _leaveTypeRemoteDataSource;

  GetLeaveTypesBloc(this._leaveTypeRemoteDataSource) : super(const _Initial()) {
    on<_GetLeaveTypes>((event, emit) async {
      emit(const _Loading());

      final result = await _leaveTypeRemoteDataSource.getLeaveTypes();

      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r.leaveTypes!)));
    });
  }
}
