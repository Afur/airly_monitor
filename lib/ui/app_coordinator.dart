import 'package:flutter/material.dart';
import 'package:airly_monitor/config/router/app_router.dart';

class AppCoordinator extends StatelessWidget {
  const AppCoordinator({
    required this.appRouter,
    required this.child,
    Key? key,
  }) : super(key: key);

  final AppRouter appRouter;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
