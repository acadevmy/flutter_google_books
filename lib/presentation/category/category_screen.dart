import 'package:flutter/material.dart';
import 'package:flutter_google_books/presentation/category/widgets/category_list_view.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Books'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: CategoryListView(),
        ),
      ),
    );
  }
}
