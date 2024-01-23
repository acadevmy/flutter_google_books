import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_books/domain/entities/volume.dart';
import 'package:flutter_google_books/presentation/category_overview/category_overview_screen.dart';
import 'package:flutter_google_books/presentation/favorite_overview/favorite_overview_screen.dart';
import 'package:flutter_google_books/presentation/home/home_screen.dart';
import 'package:flutter_google_books/presentation/models/category.dart';
import 'package:flutter_google_books/presentation/volume_details/volume_details_screen.dart';
import 'package:flutter_google_books/presentation/volume_overview/volume_overview_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: CategoryOverviewRoute.page),
        AutoRoute(page: VolumeOverviewRoute.page),
        AutoRoute(page: VolumeDetailsRoute.page),
        AutoRoute(page: FavoriteOverviewRoute.page),
      ];
}
