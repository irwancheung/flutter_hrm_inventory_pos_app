import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/designation_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_designation_bloc.freezed.dart';
part 'update_designation_event.dart';
part 'update_designation_state.dart';

class UpdateDesignationBloc extends Bloc<UpdateDesignationEvent, UpdateDesignationState> {
  final DesignationRemoteDataSource _designationRemoteDataSource;
  UpdateDesignationBloc(this._designationRemoteDataSource) : super(const _Initial()) {
    on<_UpdateDesignation>((event, emit) async {
      emit(const _Loading());

      final result = await _designationRemoteDataSource.updateDesignation(
        id: event.id,
        name: event.name,
        description: event.description,
      );
      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
