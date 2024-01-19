import 'package:flutter/material.dart';
import 'package:flutter_google_books/application/repositories/i_volume_repository.dart';
import 'package:flutter_google_books/injection.dart';
import 'package:flutter_google_books/presentation/category/widgets/category_list_view.dart';
import 'package:flutter_google_books/presentation/volume/widgets/volume_list_view.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var title = '';
  var controller = TextEditingController(text: '');

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() => title = controller.text);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Books'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: [
              Form(
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: Visibility(
                      visible: controller.text.isNotEmpty,
                      child: IconButton(
                        onPressed: () => controller.text = '',
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding: const EdgeInsets.all(4),
                    prefixIcon: const Icon(Icons.search),
                    labelText: 'Search...',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Builder(
                builder: (context) {
                  if (title.isEmpty) {
                    return CategoryListView(
                      onTap: (category) => Navigator.pushNamed(context, '/volume', arguments: category),
                    );
                  }

                  return FutureBuilder(
                    future: getIt<IVolumeRepository>().searchBy(title),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return VolumeListView(volumes: snapshot.requireData);
                      }

                      return const Center(child: CircularProgressIndicator());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
