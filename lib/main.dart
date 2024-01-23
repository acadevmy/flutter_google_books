import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/volume_details/volume_details_cubit.dart';
import 'package:flutter_google_books/injection.dart';
import 'package:flutter_google_books/presentation/category_overview/category_overview_screen.dart';
import 'package:flutter_google_books/presentation/favorite_overview_screen/favorite_overview_screen.dart';
import 'package:flutter_google_books/presentation/home/home_screen.dart';
import 'package:flutter_google_books/presentation/volume_details/volume_details_screen.dart';
import 'package:flutter_google_books/presentation/volume_overview/volume_overview_screen.dart';
import 'package:json_theme/json_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  final json = await rootBundle.loadString('assets/appainter_theme.json');
  final theme = ThemeDecoder.decodeThemeData(jsonDecode(json))!;

  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;

  const MyApp({
    super.key,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<VolumeDetailsCubit>()..load(),
      child: MaterialApp(
        theme: theme,
        initialRoute: '/',
        routes: {
          '/': (_) => const HomeScreen(),
          '/categories': (_) => const CategoryOverviewScreen(),
          '/volumes': (_) => const VolumeOverviewScreen(),
          '/volume': (_) => const VolumeDetailsScreen(),
          '/favorites': (_) => const FavoriteOverviewScreen(),
        },
      ),
    );
  }
}
