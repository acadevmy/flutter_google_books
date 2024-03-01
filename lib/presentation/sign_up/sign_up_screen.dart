import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/auth/sign_up_cubit.dart';
import 'package:flutter_google_books/injection.dart';
import 'package:flutter_google_books/presentation/sign_up/widgets/sign_up_confirm_dialog.dart';
import 'package:flutter_google_books/presentation/sign_up/widgets/sign_up_form.dart';
import 'package:flutter_google_books/router.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  SignUpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpCubit>(),
      child: BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return const SignUpConfirmDialog();
                },
              );
            },
            failure: (error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error))),
          );
        },
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300.0,
                        child: Text(
                          'Sign Up',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                      const Image(
                        image: AssetImage('assets/images/sign_up.png'),
                        width: 300.0,
                      ),
                      const SizedBox(height: 20.0),
                      BlocBuilder<SignUpCubit, SignUpState>(
                        builder: (context, state) {
                          return SignUpForm(
                            emailController: _emailController,
                            passwordController: _passwordController,
                            onSignUp: () => _onSignUp(context.read<SignUpCubit>()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSignUp(SignUpCubit cubit) {
    final email = _emailController.value.text;
    final password = _passwordController.value.text;

    cubit.signUp(email, password);
  }
}
