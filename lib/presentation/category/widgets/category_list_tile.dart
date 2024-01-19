import 'package:flutter/material.dart';

class CategoryListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CategoryListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
