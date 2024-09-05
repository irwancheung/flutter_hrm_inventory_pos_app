part of 'create_leave_type_bloc.dart';

@freezed
class CreateLeaveTypeState with _$CreateLeaveTypeState {
  const factory CreateLeaveTypeState.initial() = _Initial;
  const factory CreateLeaveTypeState.loading() = _Loading;
  const factory CreateLeaveTypeState.loaded() = _Loaded;
  const factory CreateLeaveTypeState.error(String message) = _Error;
}
