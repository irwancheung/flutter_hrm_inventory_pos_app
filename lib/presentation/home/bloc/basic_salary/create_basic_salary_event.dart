part of 'create_basic_salary_bloc.dart';

@freezed
class CreateBasicSalaryEvent with _$CreateBasicSalaryEvent {
  const factory CreateBasicSalaryEvent.started() = _Started;

  const factory CreateBasicSalaryEvent.createBasicSalary({
    required int userId,
    required double basicSalary,
  }) = _CreateBasicSalary;
}
