part of 'get_designations_bloc.dart';

@freezed
class GetDesignationsEvent with _$GetDesignationsEvent {
  const factory GetDesignationsEvent.started() = _Started;
  const factory GetDesignationsEvent.getDesignations() = _GetDesignations;
}
