import 'package:flutter_google_books/domain/entities/image_links.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_links_dto.freezed.dart';

part 'image_links_dto.g.dart';

@freezed
class ImageLinksDto with _$ImageLinksDto {
  factory ImageLinksDto({
    @JsonKey(defaultValue: 'https://shorturl.at/zLU09') @Default('https://shorturl.at/zLU09') String thumbnail,
    @JsonKey(defaultValue: '') @Default('') String large,
    @JsonKey(defaultValue: '') @Default('') String medium,
    @JsonKey(defaultValue: '') @Default('') String small,
  }) = _ImageLinksDto;

  factory ImageLinksDto.fromJson(Map<String, dynamic> json) => _$ImageLinksDtoFromJson(json);

  factory ImageLinksDto.fromDomain(ImageLinks imageLinks) {
    return ImageLinksDto(
      thumbnail: imageLinks.thumbnail,
      large: imageLinks.large,
      medium: imageLinks.medium,
      small: imageLinks.small,
    );
  }

  factory ImageLinksDto.empty() => ImageLinksDto();

  const ImageLinksDto._();

  ImageLinks toDomain() {
    return ImageLinks(
      thumbnail: thumbnail,
      large: large,
      medium: medium,
      small: small,
    );
  }
}
