import 'package:flutter_google_books/domain/entities/volume.dart';

abstract interface class IVolumeRepository {
  Future<List<Volume>> searchBy(String title);

  Future<List<Volume>> getByCategory(String category);

  Future<Volume> getById(String id);
}
