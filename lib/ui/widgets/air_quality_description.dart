import 'package:airly_monitor/config/styles/text_styles/app_text_styles.dart';
import 'package:airly_monitor/extensions/aqi_extensions.dart';
import 'package:flutter/material.dart';

class AirQualityDescription extends StatelessWidget {
  const AirQualityDescription({
    super.key,
    required this.aqiIndex,
  });

  final int aqiIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Air quality is',
          style: AppTextStyles.regular().copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          aqiIndex.mappedDescription,
          style: AppTextStyles.regular().copyWith(
            color: aqiIndex.mappedColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          'today.',
          style: AppTextStyles.regular().copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
