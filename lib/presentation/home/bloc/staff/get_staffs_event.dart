part of 'get_staffs_bloc.dart';

@freezed
class GetStaffsEvent with _$GetStaffsEvent {
  const factory GetStaffsEvent.started() = _Started;
  const factory GetStaffsEvent.getStaffs() = _GetStaffs;
}
