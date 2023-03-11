import 'package:airly_monitor/cubits/auth/auth_cubit.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airly_monitor/config/injector/di.dart';
class AuthPage extends StatelessWidget implements AutoRouteWrapper {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  static const String route = '/auth';

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => DI.resolve<AuthCubit>()..checkIfAuthenticated(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            authenticated: (_) {},
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => Center(
                child: ElevatedButton(
              onPressed: () => context.read<AuthCubit>().authenticate(),
              child: Text('Authenticate'),
            )),
            authenticating: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
