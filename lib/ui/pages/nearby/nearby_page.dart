import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airly_monitor/config/injector/di.dart';
import 'package:airly_monitor/config/styles/text_styles/app_text_styles.dart';
import 'package:airly_monitor/cubits/counter/counter_cubit.dart';

class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const String route = '/home';

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => DI.resolve<CounterCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
