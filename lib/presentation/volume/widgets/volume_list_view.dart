import 'package:flutter/material.dart';
import 'package:flutter_google_books/domain/entities/volume.dart';
import 'package:flutter_google_books/presentation/volume/widgets/volume_list_tile.dart';

class VolumeListView extends StatelessWidget {
  final List<Volume> volumes;

  const VolumeListView({
    super.key,
    required this.volumes,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: volumes.length,
        itemBuilder: (_, index) {
          return VolumeListTile(
            thumbnail: volumes[index].volumeInfo.imageLinks.thumbnail,
            title: volumes[index].volumeInfo.title,
            description: volumes[index].volumeInfo.description,
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
      ),
    );
  }
}
