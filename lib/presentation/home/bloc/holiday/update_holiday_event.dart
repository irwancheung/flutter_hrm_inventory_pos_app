part of 'update_holiday_bloc.dart';

@freezed
class UpdateHolidayEvent with _$UpdateHolidayEvent {
  const factory UpdateHolidayEvent.started() = _Started;

  const factory UpdateHolidayEvent.updateHoliday({
    required int id,
    required String name,
    required int year,
    required int month,
    required DateTime date,
    required bool isWeekend,
  }) = _UpdateHoliday;
}
