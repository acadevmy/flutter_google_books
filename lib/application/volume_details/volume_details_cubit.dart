import 'package:bloc/bloc.dart';
import 'package:flutter_google_books/application/repositories/i_favorite_repository.dart';
import 'package:flutter_google_books/domain/entities/volume.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'volume_details_cubit.freezed.dart';
part 'volume_details_state.dart';

@Injectable()
class VolumeDetailsCubit extends Cubit<VolumeDetailsState> {
  final IFavoriteRepository _favoriteRepository;

  VolumeDetailsCubit(this._favoriteRepository) : super(VolumeDetailsState.initial());

  void load() {
    final favorites = _favoriteRepository.getFavorites();
    emit(state.copyWith(favorites: favorites));
  }

  bool hasFavorite(Volume volume) => _favoriteRepository.hasFavorite(volume);

  void addFavorite(Volume volume) {
    final favorites = [...state.favorites, volume];
    _favoriteRepository.setFavorites(favorites);

    emit(state.copyWith(favorites: favorites));
  }

  void removeFavorite(Volume volume) {
    final favorites = state.favorites.where((element) => element.id != volume.id).toList();
    _favoriteRepository.setFavorites(favorites);

    emit(state.copyWith(favorites: favorites));
  }
}
