import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const LinkButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          decoration: TextDecoration.underline,
          decorationColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
