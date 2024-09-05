import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/holiday_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_holiday_bloc.freezed.dart';
part 'delete_holiday_event.dart';
part 'delete_holiday_state.dart';

class DeleteHolidayBloc extends Bloc<DeleteHolidayEvent, DeleteHolidayState> {
  final HolidayRemoteDataSource _holidayRemoteDataSource;
  DeleteHolidayBloc(this._holidayRemoteDataSource) : super(const _Initial()) {
    on<_DeleteHoliday>((event, emit) async {
      emit(const _Loading());

      final result = await _holidayRemoteDataSource.deleteHoliday(event.id);

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
