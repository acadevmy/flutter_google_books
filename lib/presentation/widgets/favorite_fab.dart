import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/volume_details/volume_details_cubit.dart';

class FavoriteFab extends StatelessWidget {
  final VoidCallback onPressed;

  const FavoriteFab({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))),
      child: badges.Badge(
        badgeStyle: badges.BadgeStyle(badgeColor: Theme.of(context).primaryColor),
        badgeContent: BlocBuilder<VolumeDetailsCubit, VolumeDetailsState>(
          builder: (context, state) => Text(state.favorites.length.toString()),
        ),
        child: const Icon(Icons.list_outlined),
      ),
    );
  }
}
