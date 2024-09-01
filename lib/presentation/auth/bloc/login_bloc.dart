import 'package:bloc/bloc.dart';
import 'package:flutter_hrm_inventory_pos_app/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_hrm_inventory_pos_app/data/models/response/auth_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDataSource _authRemoteDataSource;

  LoginBloc(this._authRemoteDataSource) : super(const _Initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());

      final result = await _authRemoteDataSource.login(
        email: event.email,
        password: event.password,
      );

      result.fold(
        (l) => emit(_Error(l)),
        (r) => emit(_Success(r)),
      );
    });
  }
}
