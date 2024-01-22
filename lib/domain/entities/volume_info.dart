import 'package:flutter_google_books/domain/entities/image_links.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'volume_info.freezed.dart';

@freezed
class VolumeInfo with _$VolumeInfo {
  factory VolumeInfo({
    required String title,
    required String subtitle,
    required String description,
    required List<String> categories,
    required List<String> authors,
    required double averageRating,
    required int ratingsCount,
    required ImageLinks imageLinks,
  }) = _VolumeInfo;

  VolumeInfo._();

  String get categoriesAsString => categories.join(', ');

  String get authorsAsString => authors.join(', ');
}
