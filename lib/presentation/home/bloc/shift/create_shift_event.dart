part of 'create_shift_bloc.dart';

@freezed
class CreateShiftEvent with _$CreateShiftEvent {
  const factory CreateShiftEvent.started() = _Started;

  const factory CreateShiftEvent.createShift({
    required String name,
    required String clockInTime,
    required String clockOutTime,
  }) = _CreateShift;
}
