import 'package:airly_monitor/config/router/app_router.dart';
import 'package:airly_monitor/config/styles/dimensions/app_margins.dart';
import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/data/models/measurement.dart';
import 'package:airly_monitor/ui/widgets/air_quality_description.dart';
import 'package:airly_monitor/ui/widgets/app_card.dart';
import 'package:airly_monitor/ui/widgets/instalation_details.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class InstallationItem extends StatelessWidget {
  const InstallationItem({
    super.key,
    required this.instalation,
    required this.onSelected,
  });

  final Installation instalation;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: AppCard(
        child: Column(
          children: [
            InstalationDetails(
              instalation: instalation,
            ),
            const SizedBox(height: AppMargins.regular),
            AirQualityDescription(
              aqiIndex: instalation.measurement.currentAquIndex,
            )
          ],
        ),
      ),
    );
  }
}
