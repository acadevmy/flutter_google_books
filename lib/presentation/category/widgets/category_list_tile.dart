import 'package:flutter/material.dart';
import 'package:flutter_google_books/presentation/models/category.dart';

class CategoryListTile extends StatelessWidget {
  final Category category;

  const CategoryListTile({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(category.icon),
        title: Text(category.title),
        subtitle: Text(category.subtitle),
      ),
    );
  }
}
