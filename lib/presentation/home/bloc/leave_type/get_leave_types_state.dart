part of 'get_leave_types_bloc.dart';

@freezed
class GetLeaveTypesState with _$GetLeaveTypesState {
  const factory GetLeaveTypesState.initial() = _Initial;
  const factory GetLeaveTypesState.loading() = _Loading;
  const factory GetLeaveTypesState.loaded(List<LeaveType> leaveTypes) = _Loaded;
  const factory GetLeaveTypesState.error(String message) = _Error;
}
