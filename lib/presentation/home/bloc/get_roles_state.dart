part of 'get_roles_bloc.dart';

@freezed
class GetRolesState with _$GetRolesState {
  const factory GetRolesState.initial() = _Initial;
  const factory GetRolesState.loading() = _Loading;
  const factory GetRolesState.loaded(List<Role> roles) = _Loaded;
  const factory GetRolesState.error(String message) = _Error;
}
