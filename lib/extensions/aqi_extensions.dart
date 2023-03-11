import 'package:airly_monitor/config/styles/colors/app_colors.dart';
import 'package:airly_monitor/config/styles/icons/app_icons.dart';
import 'package:flutter/material.dart';

extension AQIExtensions on int {
  Color get mappedColor {
    if (this < 50) {
      return AppColors.green;
    } else if (this < 100) {
      return AppColors.yellow;
    } else if (this < 140) {
      return AppColors.orange;
    } else if (this < 180) {
      return AppColors.red;
    } else {
      return AppColors.purple;
    }
  }

  String get mappedDescription {
    if (this < 50) {
      return 'good';
    } else if (this < 100) {
      return 'moderate';
    } else if (this < 140) {
      return 'unhealthy';
    } else if (this < 180) {
      return 'very unhealthy';
    } else {
      return 'Poor';
    }
  }

  String get iconPath {
    if (this < 50) {
      return AppIcons.good;
    } else if (this < 100) {
      return AppIcons.moderate;
    } else if (this < 140) {
      return AppIcons.unhealthy;
    } else if (this < 180) {
      return AppIcons.veryUnhealthy;
    } else {
      return AppIcons.poor;
    }
  }
}