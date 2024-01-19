import 'package:flutter_google_books/domain/entities/volume.dart';
import 'package:flutter_google_books/infrastructure/data_transfer_objects/volume_info_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'volume_dto.freezed.dart';

part 'volume_dto.g.dart';

@freezed
class VolumeDto with _$VolumeDto {
  factory VolumeDto({
    required String id,
    required String etag,
    required String selfLink,
    required VolumeInfoDto volumeInfo,
  }) = _VolumeDto;

  factory VolumeDto.fromJson(Map<String, dynamic> json) => _$VolumeDtoFromJson(json);

  factory VolumeDto.fromDomain(Volume volume) {
    return VolumeDto(
      id: volume.id,
      etag: volume.etag,
      selfLink: volume.selfLink,
      volumeInfo: VolumeInfoDto.fromDomain(volume.volumeInfo),
    );
  }

  const VolumeDto._();

  Volume toDomain() {
    return Volume(
      id: id,
      etag: etag,
      selfLink: selfLink,
      volumeInfo: volumeInfo.toDomain(),
    );
  }
}
