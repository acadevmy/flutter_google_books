import 'dart:convert';

import 'package:flutter_google_books/application/repositories/i_volume_repository.dart';
import 'package:flutter_google_books/domain/entities/volume.dart';
import 'package:flutter_google_books/infrastructure/data_transfer_objects/volume_response_dto.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@LazySingleton(as: IVolumeRepository)
class VolumeRepository implements IVolumeRepository {
  final _baseUrl = 'https://www.googleapis.com';

  @override
  Future<List<Volume>> searchBy(String title) async {
    final response = await http.get(Uri.parse('$_baseUrl/books/v1/volumes?q=$title'));
    final decoded = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    final items = VolumeResponseDto.fromJson(decoded).items;

    return items.map((item) => item.toDomain()).toList();
  }

  @override
  Future<List<Volume>> getByCategory(String category) async {
    final response = await http.get(Uri.parse('$_baseUrl/books/v1/volumes?q=subject:$category'));
    final decoded = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    final items = VolumeResponseDto.fromJson(decoded).items;

    return items.map((item) => item.toDomain()).toList();
  }

  @override
  Future<Volume> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
}
