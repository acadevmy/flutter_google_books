import 'package:flutter/material.dart';
import 'package:flutter_google_books/application/repositories/i_volume_repository.dart';
import 'package:flutter_google_books/injection.dart';
import 'package:flutter_google_books/presentation/models/category.dart';
import 'package:flutter_google_books/presentation/volume/widgets/volume_list_view.dart';

class VolumeScreen extends StatelessWidget {
  const VolumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final args = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Google Books'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(child: Icon(args.icon, color: color, size: 30.0)),
                    const WidgetSpan(child: SizedBox(width: 10.0)),
                    TextSpan(
                      text: args.title,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: color),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              FutureBuilder(
                  future: getIt<IVolumeRepository>().getByCategory(args.title),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return VolumeListView(volumes: snapshot.requireData);
                    }

                    return const Center(child: CircularProgressIndicator());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
