import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_books/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Books'),
      ),
      body: SafeArea(
        child: Center(
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
                width: 350.0,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => context.replaceRoute(const CategoryOverviewRoute()),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(250.0, 50.0)),
                ),
                child: const Text('Show Categories'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
