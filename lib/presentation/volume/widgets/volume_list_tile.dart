import 'package:flutter/material.dart';

class VolumeListTile extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String description;

  const VolumeListTile({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(thumbnail),
        title: Text(title, style: Theme.of(context).textTheme.titleSmall),
        subtitle: Text(
          description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
