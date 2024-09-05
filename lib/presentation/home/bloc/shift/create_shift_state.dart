part of 'create_shift_bloc.dart';

@freezed
class CreateShiftState with _$CreateShiftState {
  const factory CreateShiftState.initial() = _Initial;
  const factory CreateShiftState.loading() = _Loading;
  const factory CreateShiftState.loaded() = _Loaded;
  const factory CreateShiftState.error(String message) = _Error;
}
