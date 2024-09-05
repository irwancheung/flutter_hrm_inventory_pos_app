part of 'create_department_bloc.dart';

@freezed
class CreateDepartmentState with _$CreateDepartmentState {
  const factory CreateDepartmentState.initial() = _Initial;
  const factory CreateDepartmentState.loading() = _Loading;
  const factory CreateDepartmentState.loaded() = _Loaded;
  const factory CreateDepartmentState.error(String message) = _Error;
}
