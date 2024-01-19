import 'package:flutter_google_books/domain/entities/volume_info.dart';
import 'package:flutter_google_books/infrastructure/data_transfer_objects/image_links_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'volume_info_dto.freezed.dart';

part 'volume_info_dto.g.dart';

@freezed
class VolumeInfoDto with _$VolumeInfoDto {
  factory VolumeInfoDto({
    @JsonKey(defaultValue: '') @Default('') String title,
    @JsonKey(defaultValue: '') @Default('') String subtitle,
    @JsonKey(defaultValue: '') @Default('') String description,
    @JsonKey(defaultValue: []) @Default([]) List<String> categories,
    @JsonKey(defaultValue: []) @Default([]) List<String> authors,
    @JsonKey(defaultValue: 0) @Default(0) double averageRating,
    @JsonKey(defaultValue: 0) @Default(0) int ratingsCount,
    ImageLinksDto? imageLinks,
  }) = _VolumeInfoDto;

  factory VolumeInfoDto.fromJson(Map<String, dynamic> json) => _$VolumeInfoDtoFromJson(json);

  factory VolumeInfoDto.fromDomain(VolumeInfo volumeInfo) {
    return VolumeInfoDto(
      title: volumeInfo.title,
      subtitle: volumeInfo.subtitle,
      description: volumeInfo.description,
      categories: volumeInfo.categories,
      authors: volumeInfo.authors,
      averageRating: volumeInfo.averageRating,
      ratingsCount: volumeInfo.ratingsCount,
      imageLinks: ImageLinksDto.fromDomain(volumeInfo.imageLinks),
    );
  }

  const VolumeInfoDto._();

  VolumeInfo toDomain() {
    final imageLinks = this.imageLinks ?? ImageLinksDto.empty();

    return VolumeInfo(
      title: title,
      subtitle: subtitle,
      description: description,
      categories: categories,
      authors: authors,
      averageRating: averageRating,
      ratingsCount: ratingsCount,
      imageLinks: imageLinks.toDomain(),
    );
  }
}
