part of 'get_basic_salaries_bloc.dart';

@freezed
class GetBasicSalariesEvent with _$GetBasicSalariesEvent {
  const factory GetBasicSalariesEvent.started() = _Started;
  const factory GetBasicSalariesEvent.getBasicSalaries() = _GetBasicSalaries;
}
