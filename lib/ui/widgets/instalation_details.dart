import 'package:airly_monitor/config/styles/text_styles/app_text_styles.dart';
import 'package:airly_monitor/data/models/installation.dart';
import 'package:airly_monitor/ui/widgets/air_quality_description.dart';
import 'package:airly_monitor/ui/widgets/air_quality_indicator.dart';
import 'package:flutter/material.dart';
import 'package:airly_monitor/data/models/measurement.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class InstalationDetails extends StatelessWidget {
  const InstalationDetails({
    super.key,
    required this.instalation,
  });

  final Installation instalation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AirQualityIndicator(
              aqiIndex: instalation.measurement.currentAquIndex,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      instalation.address.street ?? '',
                      style: AppTextStyles.title(),
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                  Text(
                    instalation.address.city ?? '',
                    style: AppTextStyles.description(),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${instalation.measurement.currentTemperature}°C',
                        style: AppTextStyles.regular().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${instalation.measurement.currentPressure} hPa',
                        style: AppTextStyles.regular().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(MdiIcons.waterOutline),
                          Text(
                            '${instalation.measurement.currentHumidity}%',
                            style: AppTextStyles.regular().copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
