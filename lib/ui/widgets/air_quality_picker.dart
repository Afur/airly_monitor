import 'package:airly_monitor/config/styles/dimensions/app_margins.dart';
import 'package:airly_monitor/config/styles/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class AirQualityPicker extends StatelessWidget {
  AirQualityPicker({
    super.key,
  });

  final List<String> _airQualityOptions = [
    'Good',
    'Moderate',
    'Unhealthy',
    'Very Unhealthy',
    'Poor',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send me alert when air quality is:',
            style: AppTextStyles.title().copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: AppMargins.regular),
          ..._airQualityOptions.map(
            (optionName) => GestureDetector(
              onTap: () {
                Navigator.of(context).pop(optionName.mappedAqiIndex);
              },
              child: Column(
                children: [
                  const SizedBox(height: AppMargins.small),
                  Text(
                    optionName,
                    style: AppTextStyles.regular().copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

extension on String {
  int get mappedAqiIndex {
    switch (this) {
      case 'Good':
        return 49;
      case 'Moderate':
        return 99;
      case 'Unhealthy':
        return 139;
      case 'Very Unhealthy':
        return 179;
      default:
        return 180;
    }
  }
}
