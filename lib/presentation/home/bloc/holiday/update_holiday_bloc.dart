import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/holiday_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_holiday_bloc.freezed.dart';
part 'update_holiday_event.dart';
part 'update_holiday_state.dart';

class UpdateHolidayBloc extends Bloc<UpdateHolidayEvent, UpdateHolidayState> {
  final HolidayRemoteDataSource _holidayRemoteDataSource;
  UpdateHolidayBloc(this._holidayRemoteDataSource) : super(const _Initial()) {
    on<_UpdateHoliday>((event, emit) async {
      emit(const _Loading());

      final result = await _holidayRemoteDataSource.updateHoliday(
        id: event.id,
        name: event.name,
        year: event.year,
        month: event.month,
        date: event.date,
        isWeekend: event.isWeekend,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
