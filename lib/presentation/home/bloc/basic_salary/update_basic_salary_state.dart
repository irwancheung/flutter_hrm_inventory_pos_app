part of 'update_basic_salary_bloc.dart';

@freezed
class UpdateBasicSalaryState with _$UpdateBasicSalaryState {
  const factory UpdateBasicSalaryState.initial() = _Initial;
  const factory UpdateBasicSalaryState.loading() = _Loading;
  const factory UpdateBasicSalaryState.loaded() = _Loaded;
  const factory UpdateBasicSalaryState.error(String message) = _Error;
}
