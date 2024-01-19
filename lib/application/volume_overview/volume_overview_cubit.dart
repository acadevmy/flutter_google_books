import 'package:bloc/bloc.dart';
import 'package:flutter_google_books/application/repositories/i_volume_repository.dart';
import 'package:flutter_google_books/domain/entities/volume.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'volume_overview_state.dart';

@Injectable()
class VolumeOverviewCubit extends Cubit<VolumeOverviewState> {
  final IVolumeRepository _volumeRepository;

  VolumeOverviewCubit(this._volumeRepository) : super(VolumeOverviewInitial());

  void getByCategory(String category) async {
    try {
      emit(VolumeOverviewLoading());

      final volumes = await _volumeRepository.getByCategory(category);

      emit(VolumeOverviewSuccess(volumes: volumes));
    } on Exception {
      emit(VolumeOverviewFailure(error: 'Unexpected error occurred'));
    }
  }
}
