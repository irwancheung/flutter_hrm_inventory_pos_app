part of 'get_basic_salaries_bloc.dart';

@freezed
class GetBasicSalariesState with _$GetBasicSalariesState {
  const factory GetBasicSalariesState.initial() = _Initial;
  const factory GetBasicSalariesState.loading() = _Loading;
  const factory GetBasicSalariesState.loaded(List<BasicSalary> basicSalaries) = _Loaded;
  const factory GetBasicSalariesState.error(String message) = _Error;
}
