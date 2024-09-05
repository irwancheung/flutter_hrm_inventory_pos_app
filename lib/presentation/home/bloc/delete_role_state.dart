part of 'delete_role_bloc.dart';

@freezed
class DeleteRoleState with _$DeleteRoleState {
  const factory DeleteRoleState.initial() = _Initial;
  const factory DeleteRoleState.loading() = _Loading;
  const factory DeleteRoleState.loaded() = _Loaded;
  const factory DeleteRoleState.error(String message) = _Error;
}
