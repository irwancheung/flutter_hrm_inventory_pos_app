part of 'update_shift_bloc.dart';

@freezed
class UpdateShiftState with _$UpdateShiftState {
  const factory UpdateShiftState.initial() = _Initial;
  const factory UpdateShiftState.loading() = _Loading;
  const factory UpdateShiftState.loaded() = _Loaded;
  const factory UpdateShiftState.error(String message) = _Error;
}
