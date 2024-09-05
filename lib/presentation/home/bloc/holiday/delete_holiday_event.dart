part of 'delete_holiday_bloc.dart';

@freezed
class DeleteHolidayEvent with _$DeleteHolidayEvent {
  const factory DeleteHolidayEvent.started() = _Started;
  const factory DeleteHolidayEvent.deleteHoliday(int id) = _DeleteHoliday;
}
