import 'package:flutter/material.dart';
import 'package:flutter_google_books/presentation/models/category.dart';

class CategoryListTile extends StatelessWidget {
  final VoidCallback onTap;
  final Category category;

  const CategoryListTile({
    super.key,
    required this.onTap,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        leading: Icon(category.icon),
        title: Text(category.title),
        subtitle: Text(category.subtitle),
      ),
    );
  }
}
