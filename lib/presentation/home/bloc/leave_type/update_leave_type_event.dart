part of 'update_leave_type_bloc.dart';

@freezed
class UpdateLeaveTypeEvent with _$UpdateLeaveTypeEvent {
  const factory UpdateLeaveTypeEvent.started() = _Started;
  const factory UpdateLeaveTypeEvent.updateLeaveType({
    required int id,
    required String name,
    required bool isPaid,
    required int totalLeave,
    required int maxLeavePerMonth,
  }) = _UpdateLeaveType;
}
