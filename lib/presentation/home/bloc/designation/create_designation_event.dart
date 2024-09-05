part of 'create_designation_bloc.dart';

@freezed
class CreateDesignationEvent with _$CreateDesignationEvent {
  const factory CreateDesignationEvent.started() = _Started;

  const factory CreateDesignationEvent.createDesignation({
    required String name,
    required String description,
  }) = _CreateDesignation;
}
