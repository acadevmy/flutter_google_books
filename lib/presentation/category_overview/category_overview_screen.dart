import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/volume_overview/volume_overview_cubit.dart';
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
            child: BlocProvider(
              create: (_) => getIt<VolumeOverviewCubit>(),
              child: BlocConsumer<VolumeOverviewCubit, VolumeOverviewState>(
                listener: (context, state) => state.maybeWhen(
                  failure: (error) {
                    FlushbarHelper.createError(
                      title: 'Error',
                      message: error,
                      duration: const Duration(seconds: 3),
                    ).show(context);

                    return null;
                  },
                  orElse: () => null,
                ),
                builder: (context, state) {
                  return Column(
                    children: [
                      Form(
                        child: TextFormField(
                          controller: controller,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              final cubit = context.read<VolumeOverviewCubit>();
                              cubit.searchBy(value);
                            }
                          },
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
                      if (controller.text.isEmpty) ...[
                        CategoryListView(
                          onTap: (category) => Navigator.pushNamed(context, '/volumes', arguments: category),
                        ),
                      ],
                      if (controller.text.isNotEmpty) ...[
                        state.maybeWhen(
                          loading: () => const Center(child: CircularProgressIndicator()),
                          success: (volumes) => VolumeListView(
                            onTap: (value) => Navigator.pushNamed(context, '/volume', arguments: value),
                            volumes: volumes,
                          ),
                          orElse: () => const SizedBox(),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
