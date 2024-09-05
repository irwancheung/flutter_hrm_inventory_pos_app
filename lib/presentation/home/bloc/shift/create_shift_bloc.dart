import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/shift_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_shift_bloc.freezed.dart';
part 'create_shift_event.dart';
part 'create_shift_state.dart';

class CreateShiftBloc extends Bloc<CreateShiftEvent, CreateShiftState> {
  final ShiftRemoteDataSource _shiftRemoteDataSource;
  CreateShiftBloc(this._shiftRemoteDataSource) : super(const _Initial()) {
    on<_CreateShift>((event, emit) async {
      emit(const _Loading());

      final result = await _shiftRemoteDataSource.createShift(
        name: event.name,
        clockInTime: event.clockInTime,
        clockOutTime: event.clockOutTime,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
