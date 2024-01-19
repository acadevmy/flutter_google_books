part of 'volume_overview_cubit.dart';

@immutable
abstract class VolumeOverviewState {}

class VolumeOverviewInitial extends VolumeOverviewState {}

class VolumeOverviewLoading extends VolumeOverviewState {}

class VolumeOverviewSuccess extends VolumeOverviewState {
  final List<Volume> volumes;

  VolumeOverviewSuccess({required this.volumes});
}

class VolumeOverviewFailure extends VolumeOverviewState {
  final String error;

  VolumeOverviewFailure({required this.error});
}
