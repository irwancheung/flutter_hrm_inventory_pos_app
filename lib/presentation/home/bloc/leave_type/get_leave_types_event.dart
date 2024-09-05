part of 'get_leave_types_bloc.dart';

@freezed
class GetLeaveTypesEvent with _$GetLeaveTypesEvent {
  const factory GetLeaveTypesEvent.started() = _Started;
  const factory GetLeaveTypesEvent.getLeaveTypes() = _GetLeaveTypes;
}
