import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_remote_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'logout_bloc.freezed.dart';
part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDataSource _authRemoteDataSource;

  LogoutBloc(this._authRemoteDataSource) : super(const _Initial()) {
    on<LogoutEvent>((event, emit) async {
      emit(const _Loading());

      final result = await _authRemoteDataSource.logout();

      result.fold((l) => emit(_Error(l)), (r) => emit(const _Loaded()));
    });
  }
}
