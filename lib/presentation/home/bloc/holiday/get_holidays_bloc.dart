import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/holiday_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/holiday_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_holidays_bloc.freezed.dart';
part 'get_holidays_event.dart';
part 'get_holidays_state.dart';

class GetHolidaysBloc extends Bloc<GetHolidaysEvent, GetHolidaysState> {
  final HolidayRemoteDataSource _holidayRemoteDataSource;
  GetHolidaysBloc(this._holidayRemoteDataSource) : super(const _Initial()) {
    on<_GetHolidays>((event, emit) async {
      emit(const _Loading());

      final result = await _holidayRemoteDataSource.getHolidays();

      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r.holidays!)));
    });
  }
}
