part of 'update_holiday_bloc.dart';

@freezed
class UpdateHolidayState with _$UpdateHolidayState {
  const factory UpdateHolidayState.initial() = _Initial;
  const factory UpdateHolidayState.loading() = _Loading;
  const factory UpdateHolidayState.loaded() = _Loaded;
  const factory UpdateHolidayState.error(String message) = _Error;
}
