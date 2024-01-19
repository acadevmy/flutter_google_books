import 'package:flutter_google_books/domain/entities/volume_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'volume.freezed.dart';

@freezed
class Volume with _$Volume {
  factory Volume({
    required String id,
    required String etag,
    required String selfLink,
    required VolumeInfo volumeInfo,
  }) = _Volume;
}
