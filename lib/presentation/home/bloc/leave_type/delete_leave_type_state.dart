part of 'delete_leave_type_bloc.dart';

@freezed
class DeleteLeaveTypeState with _$DeleteLeaveTypeState {
  const factory DeleteLeaveTypeState.initial() = _Initial;
  const factory DeleteLeaveTypeState.loading() = _Loading;
  const factory DeleteLeaveTypeState.loaded() = _Loaded;
  const factory DeleteLeaveTypeState.error(String message) = _Error;
}
