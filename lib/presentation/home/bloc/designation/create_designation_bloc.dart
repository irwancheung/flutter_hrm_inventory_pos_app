import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/designation_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_designation_bloc.freezed.dart';
part 'create_designation_event.dart';
part 'create_designation_state.dart';

class CreateDesignationBloc extends Bloc<CreateDesignationEvent, CreateDesignationState> {
  final DesignationRemoteDataSource _designationRemoteDataSource;
  CreateDesignationBloc(this._designationRemoteDataSource) : super(const _Initial()) {
    on<_CreateDesignation>((event, emit) async {
      emit(const _Loading());

      final result = await _designationRemoteDataSource.createDesignation(
        name: event.name,
        description: event.description,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
