part of 'delete_department_bloc.dart';

@freezed
class DeleteDepartmentState with _$DeleteDepartmentState {
  const factory DeleteDepartmentState.initial() = _Initial;
  const factory DeleteDepartmentState.loading() = _Loading;
  const factory DeleteDepartmentState.loaded() = _Loaded;
  const factory DeleteDepartmentState.error(String message) = _Error;
}
