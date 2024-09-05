import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/designation_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/designation_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_designations_bloc.freezed.dart';
part 'get_designations_event.dart';
part 'get_designations_state.dart';

class GetDesignationsBloc extends Bloc<GetDesignationsEvent, GetDesignationsState> {
  final DesignationRemoteDataSource _designationRemoteDataSource;
  GetDesignationsBloc(this._designationRemoteDataSource) : super(const _Initial()) {
    on<_GetDesignations>((event, emit) async {
      emit(const _Loading());

      final result = await _designationRemoteDataSource.getDesignations();

      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r.designations!)));
    });
  }
}
