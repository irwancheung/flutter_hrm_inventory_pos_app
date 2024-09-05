part of 'get_departments_bloc.dart';

@freezed
class GetDepartmentsEvent with _$GetDepartmentsEvent {
  const factory GetDepartmentsEvent.started() = _Started;
  const factory GetDepartmentsEvent.getDepartments() = _GetDepartments;
}
