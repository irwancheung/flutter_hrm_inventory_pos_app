import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/basic_salary_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_basic_salary_bloc.freezed.dart';
part 'update_basic_salary_event.dart';
part 'update_basic_salary_state.dart';

class UpdateBasicSalaryBloc extends Bloc<UpdateBasicSalaryEvent, UpdateBasicSalaryState> {
  final BasicSalaryRemoteDataSource _basicSalaryRemoteDataSource;
  UpdateBasicSalaryBloc(this._basicSalaryRemoteDataSource) : super(const _Initial()) {
    on<_UpdateBasicSalary>((event, emit) async {
      emit(const _Loading());

      final result = await _basicSalaryRemoteDataSource.updateBasicSalary(
        id: event.id,
        userId: event.userId,
        basicSalary: event.basicSalary,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
