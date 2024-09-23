import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/staff_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/staff_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_staffs_bloc.freezed.dart';
part 'get_staffs_event.dart';
part 'get_staffs_state.dart';

class GetStaffsBloc extends Bloc<GetStaffsEvent, GetStaffsState> {
  final StaffRemoteDataSource _staffRemoteDataSource;
  GetStaffsBloc(this._staffRemoteDataSource) : super(const _Initial()) {
    on<_GetStaffs>((event, emit) async {
      emit(const _Loading());

      final result = await _staffRemoteDataSource.getStaffs();

      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r.staffs!)));
    });
  }
}
