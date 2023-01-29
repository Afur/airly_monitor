import 'package:flutter/material.dart';
import 'package:airly_monitor/config/injector/di.dart';
import 'package:airly_monitor/ui/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI.instance.setupInjection(Env.dev);
  runApp(const App());
}
