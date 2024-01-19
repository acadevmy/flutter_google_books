import 'package:flutter/material.dart';
import 'package:flutter_google_books/application/repositories/i_volume_repository.dart';
import 'package:flutter_google_books/injection.dart';
import 'package:flutter_google_books/presentation/category_overview/widgets/category_list_view.dart';
import 'package:flutter_google_books/presentation/volume_overview/widgets/volume_list_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CategoryOverviewScreen extends HookWidget {
  const CategoryOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: '');
    useListenable(controller);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                          onPressed: () {
                            controller.text = '';
                            FocusScope.of(context).unfocus();
                          },
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
                    if (controller.text.isEmpty) {
                      return CategoryListView(
                        onTap: (category) => Navigator.pushNamed(context, '/volumes', arguments: category),
                      );
                    }

                    return FutureBuilder(
                      future: getIt<IVolumeRepository>().searchBy(controller.text),
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
      ),
    );
  }
}
