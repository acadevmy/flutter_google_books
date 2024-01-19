import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/volume_overview/volume_overview_cubit.dart';
import 'package:flutter_google_books/injection.dart';
import 'package:flutter_google_books/presentation/models/category.dart';
import 'package:flutter_google_books/presentation/volume_overview/widgets/volume_list_view.dart';

class VolumeOverviewScreen extends StatelessWidget {
  const VolumeOverviewScreen({super.key});

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
              BlocProvider(
                create: (_) => getIt<VolumeOverviewCubit>()..getByCategory(args.title),
                child: BlocListener<VolumeOverviewCubit, VolumeOverviewState>(
                  listener: (context, state) {
                    if (state is VolumeOverviewFailure) {
                      FlushbarHelper.createError(
                        title: 'Error',
                        message: state.error,
                        duration: const Duration(seconds: 3),
                      ).show(context);
                    }
                  },
                  child: BlocBuilder<VolumeOverviewCubit, VolumeOverviewState>(
                    builder: (context, state) {
                      if (state is VolumeOverviewLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is VolumeOverviewSuccess) {
                        return VolumeListView(volumes: state.volumes);
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
