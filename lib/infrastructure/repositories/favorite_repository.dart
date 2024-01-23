import 'dart:convert';

import 'package:flutter_google_books/application/repositories/i_favorite_repository.dart';
import 'package:flutter_google_books/application/services/i_device_storage.dart';
import 'package:flutter_google_books/domain/entities/volume.dart';
import 'package:flutter_google_books/infrastructure/data_transfer_objects/volume_dto.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IFavoriteRepository)
class FavoriteRepository implements IFavoriteRepository {
  final String _STORAGE_KEY = 'favorites';

  final IDeviceStorage _deviceStorage;

  FavoriteRepository(this._deviceStorage);

  @override
  bool hasFavorite(Volume volume) {
    final found = getFavorites().indexWhere((element) => element.id == volume.id);

    return found != -1;
  }

  @override
  List<Volume> getFavorites() {
    final json = _deviceStorage.getString(_STORAGE_KEY) ?? '[]';
    final volumes = jsonDecode(json) as List<dynamic>;

    return volumes.map((volume) => VolumeDto.fromJson(volume).toDomain()).toList();
  }

  @override
  void setFavorites(List<Volume> volumes) {
    final json = volumes.map((volume) => VolumeDto.fromDomain(volume).toJson()).toList();
    _deviceStorage.setString(_STORAGE_KEY, jsonEncode(json));
  }
}
