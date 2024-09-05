part of 'get_designations_bloc.dart';

@freezed
class GetDesignationsState with _$GetDesignationsState {
  const factory GetDesignationsState.initial() = _Initial;
  const factory GetDesignationsState.loading() = _Loading;
  const factory GetDesignationsState.loaded(List<Designation> designations) = _Loaded;
  const factory GetDesignationsState.error(String message) = _Error;
}
