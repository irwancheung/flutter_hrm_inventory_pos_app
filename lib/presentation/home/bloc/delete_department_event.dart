part of 'delete_department_bloc.dart';

@freezed
class DeleteDepartmentEvent with _$DeleteDepartmentEvent {
  const factory DeleteDepartmentEvent.started() = _Started;
  const factory DeleteDepartmentEvent.deleteDepartment(int id) = _DeleteDepartment;
}
