import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/basic_salary_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/basic_salary_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_basic_salaries_bloc.freezed.dart';
part 'get_basic_salaries_event.dart';
part 'get_basic_salaries_state.dart';

class GetBasicSalariesBloc extends Bloc<GetBasicSalariesEvent, GetBasicSalariesState> {
  final BasicSalaryRemoteDataSource _basicSalaryRemoteDataSource;
  GetBasicSalariesBloc(this._basicSalaryRemoteDataSource) : super(const _Initial()) {
    on<_GetBasicSalaries>((event, emit) async {
      emit(const _Loading());

      final result = await _basicSalaryRemoteDataSource.getBasicSalaries();

      result.fold((l) => emit(_Error(l)), (r) => emit(_Loaded(r.basicSalaries!)));
    });
  }
}
