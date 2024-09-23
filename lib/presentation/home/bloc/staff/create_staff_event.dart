part of 'create_staff_bloc.dart';

@freezed
class CreateStaffEvent with _$CreateStaffEvent {
  const factory CreateStaffEvent.started() = _Started;

  const factory CreateStaffEvent.createStaff({
    required StaffRequestModel data,
    required XFile photo,
  }) = _CreateStaff;
}
