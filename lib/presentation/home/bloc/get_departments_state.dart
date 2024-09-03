part of 'get_departments_bloc.dart';

@freezed
class GetDepartmentsState with _$GetDepartmentsState {
  const factory GetDepartmentsState.initial() = _Initial;
  const factory GetDepartmentsState.loading() = _Loading;
  const factory GetDepartmentsState.loaded(List<Department> departments) = _Loaded;
  const factory GetDepartmentsState.error(String message) = _Error;
}
