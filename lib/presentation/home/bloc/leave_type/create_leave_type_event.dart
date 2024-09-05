part of 'create_leave_type_bloc.dart';

@freezed
class CreateLeaveTypeEvent with _$CreateLeaveTypeEvent {
  const factory CreateLeaveTypeEvent.started() = _Started;
  const factory CreateLeaveTypeEvent.createLeaveType({
    required String name,
    required bool isPaid,
    required int totalLeave,
    required int maxLeavePerMonth,
  }) = _CreateLeaveType;
}
