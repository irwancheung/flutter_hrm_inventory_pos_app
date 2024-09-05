part of 'update_designation_bloc.dart';

@freezed
class UpdateDesignationState with _$UpdateDesignationState {
  const factory UpdateDesignationState.initial() = _Initial;
  const factory UpdateDesignationState.loading() = _Loading;
  const factory UpdateDesignationState.loaded() = _Loaded;
  const factory UpdateDesignationState.error(String error) = _Error;
}
