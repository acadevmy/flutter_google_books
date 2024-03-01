import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/auth/sign_in_cubit.dart';
import 'package:flutter_google_books/injection.dart';
import 'package:flutter_google_books/presentation/home/widgets/sign_in_form.dart';
import 'package:flutter_google_books/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInCubit>(),
      child: BlocListener<SignInCubit, SignInState>(
        listener: (context, state) {
          state.whenOrNull(
            success: () => context.navigateTo(const CategoryOverviewRoute()),
            failure: (error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error))),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Google Books'),
          ),
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 300.0,
                      child: Text(
                        'Flutter Google Books',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Image(
                      image: AssetImage('assets/images/bibliophile.png'),
                      width: 300.0,
                    ),
                    const SizedBox(height: 20.0),
                    BlocBuilder<SignInCubit, SignInState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: SignInForm(
                            emailController: _emailController,
                            passwordController: _passwordController,
                            onSignIn: () => _onSignIn(context.read<SignInCubit>()),
                          ),
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
    );
  }

  void _onSignIn(SignInCubit cubit) {
    final email = _emailController.value.text;
    final password = _passwordController.value.text;

    cubit.signIn(email, password);
  }
}
