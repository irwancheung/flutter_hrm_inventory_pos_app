part of 'get_holidays_bloc.dart';

@freezed
class GetHolidaysEvent with _$GetHolidaysEvent {
  const factory GetHolidaysEvent.started() = _Started;
  const factory GetHolidaysEvent.getHolidays() = _GetHolidays;
}
