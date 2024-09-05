part of 'delete_shift_bloc.dart';

@freezed
class DeleteShiftEvent with _$DeleteShiftEvent {
  const factory DeleteShiftEvent.started() = _Started;
  const factory DeleteShiftEvent.deleteShift(int id) = _DeleteShift;
}
