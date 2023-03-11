import 'package:airly_monitor/config/router/app_router.dart';
import 'package:airly_monitor/config/styles/dimensions/app_margins.dart';
import 'package:airly_monitor/cubits/nearby/nearby_cubit.dart';
import 'package:airly_monitor/ui/widgets/installation_item.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airly_monitor/config/injector/di.dart';
import 'package:airly_monitor/config/styles/text_styles/app_text_styles.dart';

class NearbyPage extends StatelessWidget implements AutoRouteWrapper {
  const NearbyPage({
    Key? key,
  }) : super(key: key);

  static const String route = 'nearby';

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => DI.resolve<NearbyCubit>()..findNearbyInstalations(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppMargins.large,
                vertical: AppMargins.large,
              ),
              child: Text(
                'Nearby installations',
                style: AppTextStyles.header(),
                textAlign: TextAlign.start,
              ),
            ),
            BlocBuilder<NearbyCubit, NearbyState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => Expanded(
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  data: (instalations) => Flexible(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await context
                            .read<NearbyCubit>()
                            .findNearbyInstalations();
                      },
                      child: ListView.builder(
                        itemCount: instalations.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InstallationItem(
                            onSelected: () async  {
                              await AutoRouter.of(context).push(
                                DetailsPageRoute(
                                  instalationId: instalations[index].id,
                                ),
                              );

                              await context
                                  .read<NearbyCubit>()
                                  .findNearbyInstalations();
                            },
                            instalation: instalations[index],
                          );
                        },
                      ),
                    ),
                  ),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
