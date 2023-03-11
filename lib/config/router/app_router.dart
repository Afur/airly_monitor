import 'package:airly_monitor/ui/modals/cupertino_modal.dart';
import 'package:airly_monitor/ui/pages/auth/auth_page.dart';
import 'package:airly_monitor/ui/pages/details/details_page.dart';
import 'package:airly_monitor/ui/pages/nearby/nearby_page.dart';
import 'package:airly_monitor/ui/pages/observed/observed_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:airly_monitor/ui/pages/home/home_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  routes: [
    AutoRoute(
      page: AuthPage,
      path: AuthPage.route,
    ),
    AutoRoute(
      initial: true,
      page: HomePage,
      path: HomePage.route,
      children: [
        AutoRoute(
          page: NearbyPage,
          path: NearbyPage.route,
        ),
        AutoRoute(
          page: ObservedPage,
          path: ObservedPage.route,
        ),
      ],
    ),
    CustomRoute(
      customRouteBuilder: modalsPageRoute,
      page: DetailsPage,
      path: DetailsPage.route,
    ),
  ],
)
@Singleton()
class AppRouter extends _$AppRouter {}
