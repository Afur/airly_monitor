import 'package:airly_monitor/config/styles/text_styles/app_text_styles.dart';
import 'package:airly_monitor/extensions/aqi_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AirQualityIndicator extends StatelessWidget {
  const AirQualityIndicator({
    super.key,
    required this.aqiIndex,
  });

  final int aqiIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: aqiIndex.mappedColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            top: 0,
            child: SvgPicture.asset(
              aqiIndex.iconPath,
              fit: BoxFit.contain,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'AQI',
                  style: AppTextStyles.regular().copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  aqiIndex.toString(),
                  style: AppTextStyles.title().copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
