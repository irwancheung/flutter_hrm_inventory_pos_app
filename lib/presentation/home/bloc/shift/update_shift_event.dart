part of 'update_shift_bloc.dart';

@freezed
class UpdateShiftEvent with _$UpdateShiftEvent {
  const factory UpdateShiftEvent.started() = _Started;

  const factory UpdateShiftEvent.updateShift({
    required int id,
    required String name,
    required String clockInTime,
    required String clockOutTime,
  }) = _UpdateShift;
}
