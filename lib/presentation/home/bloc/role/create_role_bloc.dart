import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/role_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_role_bloc.freezed.dart';
part 'create_role_event.dart';
part 'create_role_state.dart';

class CreateRoleBloc extends Bloc<CreateRoleEvent, CreateRoleState> {
  final RoleRemoteDataSource _roleRemoteDataSource;
  CreateRoleBloc(this._roleRemoteDataSource) : super(const _Initial()) {
    on<_CreateRole>((event, emit) async {
      emit(const _Loading());

      final result = await _roleRemoteDataSource.createRole(
          name: event.name, displayName: event.displayName, description: event.description);

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
