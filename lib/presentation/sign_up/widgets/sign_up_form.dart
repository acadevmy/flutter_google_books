import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/auth/sign_up_cubit.dart';
import 'package:flutter_google_books/presentation/widgets/link_button.dart';

class SignUpForm extends StatelessWidget {
  final VoidCallback? onSignUp;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  const SignUpForm({
    super.key,
    this.onSignUp,
    this.emailController,
    this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          const Divider(),
          const SizedBox(height: 20.0),
          BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                orElse: () => Column(
                  children: [
                    ElevatedButton(
                      onPressed: onSignUp,
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(height: 40.0),
                    LinkButton(
                      onTap: () => context.popRoute(),
                      text: 'Already Signed?',
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
