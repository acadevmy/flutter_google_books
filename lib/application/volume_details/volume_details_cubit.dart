import 'package:bloc/bloc.dart';
import 'package:flutter_google_books/domain/entities/volume.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'volume_details_cubit.freezed.dart';
part 'volume_details_state.dart';

@Injectable()
class VolumeDetailsCubit extends Cubit<VolumeDetailsState> {
  VolumeDetailsCubit() : super(VolumeDetailsState.initial());

  bool hasFavorite(Volume volume) {
    final found = state.favorites.indexWhere((element) => element.id == volume.id);

    return found != -1;
  }

  void addFavorite(Volume volume) {
    final favorites = [...state.favorites, volume];

    emit(state.copyWith(favorites: favorites));
  }

  void removeFavorite(Volume volume) {
    final favorites = state.favorites.where((element) => element.id != volume.id).toList();

    emit(state.copyWith(favorites: favorites));
  }
}
