part of 'create_role_bloc.dart';

@freezed
class CreateRoleEvent with _$CreateRoleEvent {
  const factory CreateRoleEvent.started() = _Started;

  const factory CreateRoleEvent.createRole({
    required String name,
    required String displayName,
    required String description,
  }) = _CreateRole;
}
