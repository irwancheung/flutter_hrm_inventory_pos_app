part of 'update_role_bloc.dart';

@freezed
class UpdateRoleState with _$UpdateRoleState {
  const factory UpdateRoleState.initial() = _Initial;
  const factory UpdateRoleState.loading() = _Loading;
  const factory UpdateRoleState.loaded() = _Loaded;
  const factory UpdateRoleState.error(String message) = _Error;
}
