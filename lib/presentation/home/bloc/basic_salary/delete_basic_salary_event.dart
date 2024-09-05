part of 'delete_basic_salary_bloc.dart';

@freezed
class DeleteBasicSalaryEvent with _$DeleteBasicSalaryEvent {
  const factory DeleteBasicSalaryEvent.started() = _Started;
  const factory DeleteBasicSalaryEvent.deleteBasicSalary(int id) = _DeleteBasicSalary;
}
