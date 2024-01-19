import 'package:flutter_google_books/infrastructure/data_transfer_objects/volume_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'volume_response_dto.freezed.dart';

part 'volume_response_dto.g.dart';

@freezed
class VolumeResponseDto with _$VolumeResponseDto {
  factory VolumeResponseDto({
    required String kind,
    required int totalItems,
    required List<VolumeDto> items,
  }) = _VolumeResponseDto;

  factory VolumeResponseDto.fromJson(Map<String, dynamic> json) => _$VolumeResponseDtoFromJson(json);
}
