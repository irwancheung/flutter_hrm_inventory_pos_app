import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/shift_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_shift_bloc.freezed.dart';
part 'update_shift_event.dart';
part 'update_shift_state.dart';

class UpdateShiftBloc extends Bloc<UpdateShiftEvent, UpdateShiftState> {
  final ShiftRemoteDataSource _shiftRemoteDataSource;
  UpdateShiftBloc(this._shiftRemoteDataSource) : super(const _Initial()) {
    on<_UpdateShift>((event, emit) async {
      emit(const _Loading());

      final result = await _shiftRemoteDataSource.updateShift(
        id: event.id,
        name: event.name,
        clockInTime: event.clockInTime,
        clockOutTime: event.clockOutTime,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
