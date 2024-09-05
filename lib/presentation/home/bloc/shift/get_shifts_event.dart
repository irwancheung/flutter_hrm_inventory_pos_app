part of 'get_shifts_bloc.dart';

@freezed
class GetShiftsEvent with _$GetShiftsEvent {
  const factory GetShiftsEvent.started() = _Started;
  const factory GetShiftsEvent.getShifts() = _GetShifts;
}
