part of 'get_roles_bloc.dart';

@freezed
class GetRolesEvent with _$GetRolesEvent {
  const factory GetRolesEvent.started() = _Started;
  const factory GetRolesEvent.getRoles() = _GetRoles;
}
