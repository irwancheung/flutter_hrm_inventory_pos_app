part of 'get_staffs_bloc.dart';

@freezed
class GetStaffsState with _$GetStaffsState {
  const factory GetStaffsState.initial() = _Initial;
  const factory GetStaffsState.loading() = _Loading;
  const factory GetStaffsState.loaded(List<Staff> staffs) = _Loaded;
  const factory GetStaffsState.error(String message) = _Error;
}
