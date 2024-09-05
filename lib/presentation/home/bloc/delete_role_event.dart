part of 'delete_role_bloc.dart';

@freezed
class DeleteRoleEvent with _$DeleteRoleEvent {
  const factory DeleteRoleEvent.started() = _Started;
  const factory DeleteRoleEvent.deleteRole(int id) = _DeleteRole;
}
