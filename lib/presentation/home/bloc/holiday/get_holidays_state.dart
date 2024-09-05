part of 'get_holidays_bloc.dart';

@freezed
class GetHolidaysState with _$GetHolidaysState {
  const factory GetHolidaysState.initial() = _Initial;
  const factory GetHolidaysState.loading() = _Loading;
  const factory GetHolidaysState.loaded(List<Holiday> holidays) = _Loaded;
  const factory GetHolidaysState.error(String message) = _Error;
}
