part of 'create_holiday_bloc.dart';

@freezed
class CreateHolidayEvent with _$CreateHolidayEvent {
  const factory CreateHolidayEvent.started() = _Started;

  const factory CreateHolidayEvent.createHoliday({
    required String name,
    required int year,
    required int month,
    required DateTime date,
    required bool isWeekend,
  }) = _CreateHoliday;
}
