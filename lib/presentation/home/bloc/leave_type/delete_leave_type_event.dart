part of 'delete_leave_type_bloc.dart';

@freezed
class DeleteLeaveTypeEvent with _$DeleteLeaveTypeEvent {
  const factory DeleteLeaveTypeEvent.started() = _Started;
  const factory DeleteLeaveTypeEvent.deleteLeaveType(int id) = _DeleteLeaveType;
}
