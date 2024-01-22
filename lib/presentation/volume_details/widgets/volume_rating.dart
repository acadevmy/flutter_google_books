import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class VolumeRating extends StatelessWidget {
  final double initialRating;

  const VolumeRating({
    super.key,
    required this.initialRating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Rating:',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(width: 10.0),
        RatingBar.builder(
          onRatingUpdate: (rating) {},
          ignoreGestures: true,
          initialRating: initialRating,
          itemSize: 25.0,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
        ),
      ],
    );
  }
}
