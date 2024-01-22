import 'package:flutter/material.dart';

class VolumeInfo extends StatelessWidget {
  final String label;
  final String description;

  const VolumeInfo({
    super.key,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800),
            ),
          ),
          const WidgetSpan(child: SizedBox(width: 10.0)),
          TextSpan(
            text: description,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
