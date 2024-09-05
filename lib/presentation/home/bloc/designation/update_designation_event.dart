part of 'update_designation_bloc.dart';

@freezed
class UpdateDesignationEvent with _$UpdateDesignationEvent {
  const factory UpdateDesignationEvent.started() = _Started;

  const factory UpdateDesignationEvent.updateDesignation({
    required int id,
    required String name,
    required String description,
  }) = _UpdateDesignation;
}
