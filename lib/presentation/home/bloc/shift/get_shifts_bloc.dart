import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/shift_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/shift_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_shifts_bloc.freezed.dart';
part 'get_shifts_event.dart';
part 'get_shifts_state.dart';

class GetShiftsBloc extends Bloc<GetShiftsEvent, GetShiftsState> {
  final ShiftRemoteDataSource _shiftRemoteDataSource;

  GetShiftsBloc(this._shiftRemoteDataSource) : super(const _Initial()) {
    on<_GetShifts>((event, emit) async {
      emit(const _Loading());

      final result = await _shiftRemoteDataSource.getShifts();

      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r.shifts!)));
    });
  }
}
