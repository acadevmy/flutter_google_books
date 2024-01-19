import 'package:flutter/material.dart';
import 'package:flutter_google_books/presentation/category/widgets/category_list_tile.dart';
import 'package:flutter_google_books/presentation/models/category.dart';

class CategoryListView extends StatelessWidget {
  final ValueChanged<Category> onTap;

  final List<Category> _items = [
    Category(
      icon: Icons.book,
      title: 'History',
      subtitle: 'For those who love ancient, modern and contemporary history.',
    ),
    Category(
      icon: Icons.person,
      title: 'Biography',
      subtitle: 'For those who love the life stories of men of the past.',
    ),
    Category(
      icon: Icons.history_edu,
      title: 'Poetry',
      subtitle: 'For those who love emotions, suggestions and rhymes.',
    ),
    Category(
      icon: Icons.sailing,
      title: 'Adventure',
      subtitle: 'For those who love to immerse themselves in new adventures.',
    ),
    Category(
      icon: Icons.castle,
      title: 'Fiction',
      subtitle: 'For those who love to immerse themselves in new fantastic stories.',
    ),
    Category(
      icon: Icons.soup_kitchen,
      title: 'Cooking',
      subtitle: 'For those who love to delight in new delicious dishes.',
    ),
  ];

  CategoryListView({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: _items.length,
        itemBuilder: (context, index) => CategoryListTile(
          onTap: () => onTap(_items[index]),
          category: _items[index],
        ),
        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
      ),
    );
  }
}
