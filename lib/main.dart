import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_google_books/application/auth/sign_in_cubit.dart';
import 'package:flutter_google_books/application/volume_details/volume_details_cubit.dart';
import 'package:flutter_google_books/firebase_options.dart';
import 'package:flutter_google_books/injection.dart';
import 'package:flutter_google_books/router.dart';
import 'package:json_theme/json_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final json = await rootBundle.loadString('assets/appainter_theme.json');
  final theme = ThemeDecoder.decodeThemeData(jsonDecode(json))!;

  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  final ThemeData theme;

  MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<VolumeDetailsCubit>()..load(),
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
        theme: theme,
      ),
    );
  }
}
