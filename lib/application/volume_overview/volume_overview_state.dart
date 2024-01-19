part of 'volume_overview_cubit.dart';

@freezed
class VolumeOverviewState with _$VolumeOverviewState {
  const factory VolumeOverviewState.initial() = _Initial;

  const factory VolumeOverviewState.loading() = _Loading;

  const factory VolumeOverviewState.success(List<Volume> volumes) = _Success;

  const factory VolumeOverviewState.failure(String error) = _Failure;
}
