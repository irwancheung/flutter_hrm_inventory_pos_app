import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/role_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_role_bloc.freezed.dart';
part 'delete_role_event.dart';
part 'delete_role_state.dart';

class DeleteRoleBloc extends Bloc<DeleteRoleEvent, DeleteRoleState> {
  final RoleRemoteDataSource _roleRemoteDataSource;
  DeleteRoleBloc(this._roleRemoteDataSource) : super(const _Initial()) {
    on<_DeleteRole>((event, emit) async {
      emit(const _Loading());

      final result = await _roleRemoteDataSource.deleteRole(event.id);

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
