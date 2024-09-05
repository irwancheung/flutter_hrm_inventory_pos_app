part of 'update_leave_type_bloc.dart';

@freezed
class UpdateLeaveTypeState with _$UpdateLeaveTypeState {
  const factory UpdateLeaveTypeState.initial() = _Initial;
  const factory UpdateLeaveTypeState.loading() = _Loading;
  const factory UpdateLeaveTypeState.loaded() = _Loaded;
  const factory UpdateLeaveTypeState.error(String message) = _Error;
}
