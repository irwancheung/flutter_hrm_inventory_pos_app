part of 'create_staff_bloc.dart';

@freezed
class CreateStaffState with _$CreateStaffState {
  const factory CreateStaffState.initial() = _Initial;
  const factory CreateStaffState.loading() = _Loading;
  const factory CreateStaffState.loaded() = _Loaded;
  const factory CreateStaffState.error(String message) = _Error;
}
