part of 'delete_designation_bloc.dart';

@freezed
class DeleteDesignationEvent with _$DeleteDesignationEvent {
  const factory DeleteDesignationEvent.started() = _Started;
  const factory DeleteDesignationEvent.deleteDesignation(int id) = _DeleteDesignation;
}
