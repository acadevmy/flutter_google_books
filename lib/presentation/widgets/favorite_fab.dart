import 'package:flutter/material.dart';

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
      child: const Icon(Icons.list_outlined),
    );
  }
}
