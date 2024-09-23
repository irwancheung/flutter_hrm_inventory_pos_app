import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/role_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/role_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_roles_bloc.freezed.dart';
part 'get_roles_event.dart';
part 'get_roles_state.dart';

class GetRolesBloc extends Bloc<GetRolesEvent, GetRolesState> {
  final RoleRemoteDataSource _roleRemoteDataSource;
  GetRolesBloc(this._roleRemoteDataSource) : super(const _Initial()) {
    on<_GetRoles>((event, emit) async {
      emit(const _Loading());

      final result = await _roleRemoteDataSource.getRoles();

      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r.roles!)));
    });
  }
}
