import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_books/router.dart';

class SignUpConfirmDialog extends StatelessWidget {
  const SignUpConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      title: const Text('Sign Up with Success'),
      content: const Text('Now you can sign in!'),
      actions: [
        TextButton(
          onPressed: () {
            context.popRoute();
            context.navigateTo(HomeRoute());
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
