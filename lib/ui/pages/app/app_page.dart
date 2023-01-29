import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:airly_monitor/config/router/app_router.dart';
import 'package:airly_monitor/config/styles/theme/app_theme.dart';

class AppPage extends StatefulWidget {
  const AppPage({
    required this.appRouter,
    Key? key,
  }) : super(key: key);

  final AppRouter appRouter;

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
      ],
      routerDelegate: widget.appRouter.delegate(
        initialRoutes: [
          _prepareInitialRoute(),
        ],
      ),
      routeInformationParser: widget.appRouter.defaultRouteParser(),
      theme: AppTheme.fromType(ThemeType.light).themeData,
    );
  }

  PageRouteInfo _prepareInitialRoute() {
    return const AuthPageRoute();
  }
}
