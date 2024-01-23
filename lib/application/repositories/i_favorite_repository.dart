import 'package:flutter_google_books/domain/entities/volume.dart';

abstract class IFavoriteRepository {
  bool hasFavorite(Volume volume);

  List<Volume> getFavorites();

  void setFavorites(List<Volume> volumes);
}
