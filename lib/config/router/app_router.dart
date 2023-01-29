import 'package:airly_monitor/ui/pages/auth/auth_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:airly_monitor/ui/pages/home/home_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  routes: [
    AutoRoute(
      initial: true,
      page: AuthPage,
      path: AuthPage.route,
    ),
    AutoRoute(
      page: HomePage,
      path: HomePage.route,
    ),
  ],
)
@Singleton()
class AppRouter extends _$AppRouter {}
