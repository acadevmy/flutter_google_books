import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/volume_details/volume_details_cubit.dart';
import 'package:flutter_google_books/presentation/widgets/headline.dart';
import 'package:flutter_google_books/presentation/widgets/volume_list_view.dart';
import 'package:flutter_google_books/router.dart';

@RoutePage()
class FavoriteOverviewScreen extends StatelessWidget {
  const FavoriteOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Books'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: <Widget>[
              const Headline(title: 'Favorites', icon: Icons.favorite),
              const SizedBox(height: 30.0),
              BlocBuilder<VolumeDetailsCubit, VolumeDetailsState>(
                builder: (context, state) {
                  return VolumeListView(
                    onTap: (volume) => context.pushRoute(VolumeDetailsRoute(volume: volume)),
                    volumes: state.favorites,
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
