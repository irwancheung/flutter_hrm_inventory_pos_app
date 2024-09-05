import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/basic_salary_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_basic_salary_bloc.freezed.dart';
part 'delete_basic_salary_event.dart';
part 'delete_basic_salary_state.dart';

class DeleteBasicSalaryBloc extends Bloc<DeleteBasicSalaryEvent, DeleteBasicSalaryState> {
  final BasicSalaryRemoteDataSource _basicSalaryRemoteDataSource;
  DeleteBasicSalaryBloc(this._basicSalaryRemoteDataSource) : super(const _Initial()) {
    on<_DeleteBasicSalary>((event, emit) async {
      emit(const _Loading());

      final result = await _basicSalaryRemoteDataSource.deleteBasicSalary(event.id);

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
