import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/holiday_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_holiday_bloc.freezed.dart';
part 'create_holiday_event.dart';
part 'create_holiday_state.dart';

class CreateHolidayBloc extends Bloc<CreateHolidayEvent, CreateHolidayState> {
  final HolidayRemoteDataSource _holidayRemoteDataSource;
  CreateHolidayBloc(this._holidayRemoteDataSource) : super(const _Initial()) {
    on<_CreateHoliday>((event, emit) async {
      emit(const _Loading());

      final result = await _holidayRemoteDataSource.createHoliday(
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
