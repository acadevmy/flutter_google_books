import 'package:bloc/bloc.dart';
import 'package:flutter_google_books/application/repositories/i_volume_repository.dart';
import 'package:flutter_google_books/domain/entities/volume.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'volume_overview_cubit.freezed.dart';
part 'volume_overview_state.dart';

@Injectable()
class VolumeOverviewCubit extends Cubit<VolumeOverviewState> {
  final IVolumeRepository _volumeRepository;

  VolumeOverviewCubit(this._volumeRepository) : super(const VolumeOverviewState.initial());

  void searchBy(String title) async {
    try {
      emit(const VolumeOverviewState.loading());

      final volumes = await _volumeRepository.searchBy(title);

      emit(VolumeOverviewState.success(volumes));
    } on Error {
      emit(const VolumeOverviewState.failure('Unexpected error occurred'));
    }
  }

  void getByCategory(String category) async {
    try {
      emit(const VolumeOverviewState.loading());

      final volumes = await _volumeRepository.getByCategory(category);

      emit(VolumeOverviewState.success(volumes));
    } on Error {
      emit(const VolumeOverviewState.failure('Unexpected error occurred'));
    }
  }
}
