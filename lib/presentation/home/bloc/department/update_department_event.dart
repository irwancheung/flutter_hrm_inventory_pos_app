part of 'update_department_bloc.dart';

@freezed
class UpdateDepartmentEvent with _$UpdateDepartmentEvent {
  const factory UpdateDepartmentEvent.started() = _Started;

  const factory UpdateDepartmentEvent.updateDepartment({
    required int id,
    required String name,
    required String description,
  }) = _UpdateDepartment;
}
