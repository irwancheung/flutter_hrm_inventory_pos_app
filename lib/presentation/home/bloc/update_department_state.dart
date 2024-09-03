part of 'update_department_bloc.dart';

@freezed
class UpdateDepartmentState with _$UpdateDepartmentState {
  const factory UpdateDepartmentState.initial() = _Initial;
  const factory UpdateDepartmentState.loading() = _Loading;
  const factory UpdateDepartmentState.loaded() = _Loaded;
  const factory UpdateDepartmentState.error(String message) = _Error;
}
