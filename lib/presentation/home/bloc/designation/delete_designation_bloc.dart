import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/designation_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_designation_bloc.freezed.dart';
part 'delete_designation_event.dart';
part 'delete_designation_state.dart';

class DeleteDesignationBloc extends Bloc<DeleteDesignationEvent, DeleteDesignationState> {
  final DesignationRemoteDataSource _designationRemoteDataSource;
  DeleteDesignationBloc(this._designationRemoteDataSource) : super(const _Initial()) {
    on<_DeleteDesignation>((event, emit) async {
      emit(const _Loading());

      final result = await _designationRemoteDataSource.deleteDesignation(event.id);

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
