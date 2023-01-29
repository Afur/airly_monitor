import 'package:flutter/material.dart';
import 'package:airly_monitor/config/injector/di.dart';
import 'package:airly_monitor/config/router/app_router.dart';
import 'package:airly_monitor/ui/pages/app/app_page.dart';
import 'package:airly_monitor/ui/app_coordinator.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AppCoordinator(
      appRouter: DI.resolve<AppRouter>(),
      child: AppPage(
        appRouter: DI.resolve<AppRouter>(),
      ),
    );
  }
}
