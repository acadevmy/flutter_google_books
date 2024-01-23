import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/volume_overview/volume_overview_cubit.dart';
import 'package:flutter_google_books/injection.dart';
import 'package:flutter_google_books/presentation/models/category.dart';
import 'package:flutter_google_books/presentation/widgets/favorite_fab.dart';
import 'package:flutter_google_books/presentation/widgets/headline.dart';
import 'package:flutter_google_books/presentation/widgets/volume_list_view.dart';
import 'package:flutter_google_books/router.dart';

@RoutePage()
class VolumeOverviewScreen extends StatelessWidget {
  final Category category;

  const VolumeOverviewScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Books'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: <Widget>[
              Headline(
                title: category.title,
                icon: category.icon,
                iconColor: color,
              ),
              const SizedBox(height: 30.0),
              BlocProvider(
                create: (_) => getIt<VolumeOverviewCubit>()..getByCategory(category.title),
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
                      onTap: (volume) => context.pushRoute(VolumeDetailsRoute(volume: volume)),
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
        onPressed: () => context.pushRoute(const FavoriteOverviewRoute()),
      ),
    );
  }
}
