import 'package:flutter/material.dart';
import 'package:flutter_google_books/presentation/category/widgets/category_list_tile.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Books'),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: CategoryListTile(
            icon: Icons.soup_kitchen,
            title: 'La cucina per tutti di Casa Pappagallo',
            subtitle: 'Un ricettario che celebra il cibo e la condivisione',
          ),
        ),
      ),
    );
  }
}
