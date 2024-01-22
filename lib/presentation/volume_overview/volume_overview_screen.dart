import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/volume_overview/volume_overview_cubit.dart';
import 'package:flutter_google_books/injection.dart';
import 'package:flutter_google_books/presentation/models/category.dart';
import 'package:flutter_google_books/presentation/widgets/headline.dart';
import 'package:flutter_google_books/presentation/widgets/volume_list_view.dart';
import 'package:flutter_google_books/presentation/widgets/favorite_fab.dart';

class VolumeOverviewScreen extends StatelessWidget {
  const VolumeOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final args = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Books'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: <Widget>[
              Headline(title: args.title, icon: args.icon, iconColor: color),
              const SizedBox(height: 30.0),
              BlocProvider(
                create: (_) => getIt<VolumeOverviewCubit>()..getByCategory(args.title),
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
                  builder: (context, state) => state.maybeWhen(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    success: (volumes) => VolumeListView(
                      onTap: (value) => Navigator.pushNamed(context, '/volume', arguments: value),
                      volumes: volumes,
                    ),
                    orElse: () => const SizedBox(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FavoriteFab(
        onPressed: () => Navigator.of(context).pushNamed('/favorites'),
      ),
    );
  }
}
