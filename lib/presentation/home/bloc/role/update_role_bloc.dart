import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/role_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_role_bloc.freezed.dart';
part 'update_role_event.dart';
part 'update_role_state.dart';

class UpdateRoleBloc extends Bloc<UpdateRoleEvent, UpdateRoleState> {
  final RoleRemoteDataSource _roleRemoteDataSource;
  UpdateRoleBloc(this._roleRemoteDataSource) : super(const _Initial()) {
    on<_UpdateRole>((event, emit) async {
      emit(const _Loading());

      final result = await _roleRemoteDataSource.updateRole(
        id: event.id,
        name: event.name,
        displayName: event.displayName,
        description: event.description,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
