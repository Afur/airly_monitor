import 'package:airly_monitor/config/styles/dimensions/app_margins.dart';
import 'package:airly_monitor/config/styles/text_styles/app_text_styles.dart';
import 'package:airly_monitor/data/models/measurement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MeasurementDetails extends StatelessWidget {
  const MeasurementDetails({
    super.key,
    required this.measurement,
  });

  final Measurement measurement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...measurement.measurementValues
            .where((item) => [
                  "PM1",
                  "PM10",
                  "PM25",
                  "NO2",
                  "O3",
                ].contains(item.name))
            .map(
              (item) => Column(
                children: [
                  const SizedBox(height: AppMargins.small),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _measurementSymbol(item.name),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            item.value.toInt().toString(),
                            style: AppTextStyles.title().copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "µg/m3",
                            style: AppTextStyles.description().copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ],
              ),
            )
      ],
    );
  }

  Widget _measurementSymbol(String measurementName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          measurementName.replaceAll(RegExp(r'[0-9]'), ''),
          style: AppTextStyles.title().copyWith(
            color: Colors.black,
          ),
        ),
        Text(
          measurementName.replaceAll(RegExp(r'[a-zA-Z]'), ''),
          style: AppTextStyles.description().copyWith(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
