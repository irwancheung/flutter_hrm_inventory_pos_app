import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/basic_salary_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_basic_salary_bloc.freezed.dart';
part 'create_basic_salary_event.dart';
part 'create_basic_salary_state.dart';

class CreateBasicSalaryBloc extends Bloc<CreateBasicSalaryEvent, CreateBasicSalaryState> {
  final BasicSalaryRemoteDataSource _basicSalaryRemoteDataSource;

  CreateBasicSalaryBloc(this._basicSalaryRemoteDataSource) : super(const _Initial()) {
    on<_CreateBasicSalary>((event, emit) async {
      emit(const _Loading());

      final result = await _basicSalaryRemoteDataSource.createBasicSalary(
        userId: event.userId,
        basicSalary: event.basicSalary,
      );

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
