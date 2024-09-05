part of 'delete_basic_salary_bloc.dart';

@freezed
class DeleteBasicSalaryState with _$DeleteBasicSalaryState {
  const factory DeleteBasicSalaryState.initial() = _Initial;
  const factory DeleteBasicSalaryState.loading() = _Loading;
  const factory DeleteBasicSalaryState.loaded() = _Loaded;
  const factory DeleteBasicSalaryState.error(String message) = _Error;
}
