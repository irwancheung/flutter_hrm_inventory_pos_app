part of 'create_department_bloc.dart';

@freezed
class CreateDepartmentEvent with _$CreateDepartmentEvent {
  const factory CreateDepartmentEvent.started() = _Started;

  const factory CreateDepartmentEvent.createDepartment({
    required String name,
    required String description,
  }) = _CreateDepartment;
}
