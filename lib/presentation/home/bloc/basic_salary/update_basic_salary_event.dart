part of 'update_basic_salary_bloc.dart';

@freezed
class UpdateBasicSalaryEvent with _$UpdateBasicSalaryEvent {
  const factory UpdateBasicSalaryEvent.started() = _Started;

  const factory UpdateBasicSalaryEvent.updateBasicSalary({
    required int id,
    required int userId,
    required double basicSalary,
  }) = _UpdateBasicSalary;
}
