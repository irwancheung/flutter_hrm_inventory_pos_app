import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/shift_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_shift_bloc.freezed.dart';
part 'delete_shift_event.dart';
part 'delete_shift_state.dart';

class DeleteShiftBloc extends Bloc<DeleteShiftEvent, DeleteShiftState> {
  final ShiftRemoteDataSource _shiftRemoteDataSource;
  DeleteShiftBloc(this._shiftRemoteDataSource) : super(const _Initial()) {
    on<_DeleteShift>((event, emit) async {
      emit(const _Loading());

      final result = await _shiftRemoteDataSource.deleteShift(event.id);

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
