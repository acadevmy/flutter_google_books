import 'package:flutter/material.dart';

class VolumeListTile extends StatelessWidget {
  final VoidCallback onTap;
  final String thumbnail;
  final String title;
  final String description;

  const VolumeListTile({
    super.key,
    required this.onTap,
    required this.thumbnail,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
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
