import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/staff_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/request/staff_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'create_staff_bloc.freezed.dart';
part 'create_staff_event.dart';
part 'create_staff_state.dart';

class CreateStaffBloc extends Bloc<CreateStaffEvent, CreateStaffState> {
  final StaffRemoteDataSource _staffRemoteDataSource;

  CreateStaffBloc(this._staffRemoteDataSource) : super(const _Initial()) {
    on<_CreateStaff>((event, emit) async {
      emit(const _Loading());

      final result = await _staffRemoteDataSource.createStaff(data: event.data, photo: event.photo);

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
