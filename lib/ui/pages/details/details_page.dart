import 'package:airly_monitor/config/styles/colors/app_colors.dart';
import 'package:airly_monitor/config/styles/dimensions/app_margins.dart';
import 'package:airly_monitor/cubits/details/cubit/details_cubit.dart';
import 'package:airly_monitor/data/models/measurement.dart';
import 'package:airly_monitor/ui/widgets/air_quality_description.dart';
import 'package:airly_monitor/ui/widgets/air_quality_picker.dart';
import 'package:airly_monitor/ui/widgets/instalation_details.dart';
import 'package:airly_monitor/ui/widgets/measurements_details.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:airly_monitor/config/injector/di.dart';
import 'package:airly_monitor/config/styles/text_styles/app_text_styles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class DetailsPage extends StatelessWidget implements AutoRouteWrapper {
  const DetailsPage({
    Key? key,
    required this.instalationId,
  }) : super(key: key);

  static const String route = 'details/:instalationId';

  final int instalationId;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => DI.resolve<DetailsCubit>()..load(instalationId),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                MdiIcons.windowClose,
                color: Colors.grey,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppMargins.regular,
                horizontal: AppMargins.large,
              ),
              child: BlocBuilder<DetailsCubit, DetailsState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => Expanded(
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    loaded: (instalation) => Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            InstalationDetails(
                              instalation: instalation,
                            ),
                            const SizedBox(height: AppMargins.large),
                            AirQualityDescription(
                              aqiIndex: instalation.measurement.currentAquIndex,
                            ),
                            const SizedBox(height: AppMargins.large),
                            if (instalation.measurement != null)
                              MeasurementDetails(
                                measurement: instalation.measurement!,
                              ),
                            const SizedBox(height: AppMargins.large),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: AppColors.background,
                                side: BorderSide(width: 1, color: Colors.black),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                if (instalation.marked) {
                                  await context
                                      .read<DetailsCubit>()
                                      .stopObserving(
                                        instalationId,
                                      );
                                } else {
                                  await context
                                      .read<DetailsCubit>()
                                      .startObserving(
                                        instalationId,
                                      );
                                }
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    instalation.marked
                                        ? 'Remove from observed installations'
                                        : 'Add to observed installations',
                                    style: AppTextStyles.regular().copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: AppMargins.small),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: AppColors.background,
                                side: BorderSide(width: 1, color: Colors.black),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () async {
                                if (instalation.hasAlert) {
                                  await context
                                      .read<DetailsCubit>()
                                      .removeAlert(
                                        instalationId,
                                      );
                                } else {
                                  final selectedAqiIndex =
                                      await showModalBottomSheet<int>(
                                    context: context,
                                    builder: (context) => AirQualityPicker(),
                                  );

                                  if (selectedAqiIndex != null) {
                                    // ignore: use_build_context_synchronously
                                    await context
                                        .read<DetailsCubit>()
                                        .createAlert(
                                          installationId: instalationId,
                                          whenAqiReaches: selectedAqiIndex,
                                        );
                                  }
                                }
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Center(
                                  child: Text(
                                    instalation.hasAlert
                                        ? 'Stop sending alerts'
                                        : 'Send me alerts when...',
                                    style: AppTextStyles.regular().copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
