import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/volume_details/volume_details_cubit.dart';
import 'package:flutter_google_books/domain/entities/volume.dart';
import 'package:flutter_google_books/presentation/volume_details/widgets/volume_info.dart';
import 'package:flutter_google_books/presentation/volume_details/widgets/volume_rating.dart';

@RoutePage()
class VolumeDetailsScreen extends StatelessWidget {
  final Volume volume;

  const VolumeDetailsScreen({
    super.key,
    required this.volume,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(volume.volumeInfo.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Image.network(volume.volumeInfo.imageLinks.thumbnail),
                ),
                const SizedBox(height: 20.0),
                VolumeInfo(label: 'Categories:', description: volume.volumeInfo.categoriesAsString),
                const SizedBox(height: 20.0),
                VolumeInfo(label: 'Authors:', description: volume.volumeInfo.authorsAsString),
                const SizedBox(height: 20.0),
                Text(
                  'Description:',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(
                  volume.volumeInfo.description,
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20.0),
                VolumeRating(initialRating: volume.volumeInfo.averageRating),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: BlocBuilder<VolumeDetailsCubit, VolumeDetailsState>(
        builder: (context, state) {
          final cubit = context.read<VolumeDetailsCubit>();
          final icon = cubit.hasFavorite(volume) ? Icons.favorite : Icons.favorite_outline;

          return FloatingActionButton(
            onPressed: () {
              if (cubit.hasFavorite(volume)) {
                cubit.removeFavorite(volume);
                return;
              }

              cubit.addFavorite(volume);
            },
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))),
            child: Icon(icon),
          );
        },
      ),
    );
  }
}
