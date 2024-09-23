part of 'update_role_bloc.dart';

@freezed
class UpdateRoleEvent with _$UpdateRoleEvent {
  const factory UpdateRoleEvent.started() = _Started;

  const factory UpdateRoleEvent.updateRole({
    required int id,
    required String name,
    required String displayName,
    required String description,
  }) = _UpdateRole;
}
