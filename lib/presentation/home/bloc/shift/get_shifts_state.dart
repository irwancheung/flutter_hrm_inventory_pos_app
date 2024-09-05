part of 'get_shifts_bloc.dart';

@freezed
class GetShiftsState with _$GetShiftsState {
  const factory GetShiftsState.initial() = _Initial;
  const factory GetShiftsState.loading() = _Loading;
  const factory GetShiftsState.loaded(List<Shift> shifts) = _Loaded;
  const factory GetShiftsState.error(String message) = _Error;
}
