import 'package:airly_monitor/config/router/app_router.dart';
import 'package:airly_monitor/config/styles/dimensions/app_margins.dart';
import 'package:airly_monitor/config/styles/text_styles/app_text_styles.dart';
import 'package:airly_monitor/cubits/home/cubit/home_cubit.dart';
import 'package:airly_monitor/ui/base/lifecycle_aware_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:airly_monitor/config/injector/di.dart';

class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const String route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => DI.resolve<HomeCubit>()..checkLocationPermissions(),
      child: this,
    );
  }
}

class _HomePageState extends LifecycleAwareState<HomePage> {
  bool _didOpenSettings = false;

  @override
  void onResumed() {
    super.onResumed();
    if(_didOpenSettings) {
      context.read<HomeCubit>().checkLocationPermissions();

      setState(() {
        _didOpenSettings = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.message),
                ),
              );
            },
            orElse: () => null,
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            permissionGranted: () => _buildBody(context),
            permissionNotGranted: () => _buildPermissionNotGrantedBody(context),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        NearbyPageRoute(),
        ObservedPageRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.mapMarker),
              label: 'Nearby',
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.databaseMarker),
              label: 'Observed',
            ),
          ],
        );
      },
    );
  }

  Widget _buildPermissionNotGrantedBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppMargins.regular),
          child: Column(
            children: [
              Text(
                'No permissions granted',
                style: AppTextStyles.title(),
              ),
              Text(
                'In order to use this app you need to grant location permission in settings.',
                style: AppTextStyles.regular(),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _didOpenSettings = true;
                  });

                  openAppSettings();
                },
                child: const Text('Open settings'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
