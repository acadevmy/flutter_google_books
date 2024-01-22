import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;

  const Headline({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = iconColor ?? Theme.of(context).primaryColor;

    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(child: Icon(icon, color: color, size: 30.0)),
          const WidgetSpan(child: SizedBox(width: 10.0)),
          TextSpan(
            text: title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: iconColor),
          ),
        ],
      ),
    );
  }
}
