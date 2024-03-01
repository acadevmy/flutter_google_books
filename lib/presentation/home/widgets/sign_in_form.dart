import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/auth/sign_in_cubit.dart';
import 'package:flutter_google_books/presentation/widgets/link_button.dart';
import 'package:flutter_google_books/router.dart';

class SignInForm extends StatelessWidget {
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final VoidCallback? onSignIn;

  const SignInForm({
    super.key,
    this.emailController,
    this.passwordController,
    this.onSignIn,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Form(
      child: Column(
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
          const SizedBox(height: 20.0),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
            ),
          ),
          const SizedBox(height: 30.0),
          BlocBuilder<SignInCubit, SignInState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                orElse: () => Column(
                  children: [
                    ElevatedButton(
                      onPressed: onSignIn,
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(const Size(250.0, 50.0)),
                      ),
                      child: const Text('Sign In'),
                    ),
                    const SizedBox(height: 15.0),
                    SizedBox(
                      height: 15,
                      child: Stack(
                        children: [
                          const Divider(),
                          Center(
                            child: Container(
                              color: backgroundColor,
                              height: 15,
                              width: 25,
                              child: const Center(
                                child: Text('Or'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    LinkButton(
                      onTap: () => context.pushRoute(SignUpRoute()),
                      text: 'Sign up',
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
