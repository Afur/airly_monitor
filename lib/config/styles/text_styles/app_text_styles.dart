import 'package:airly_monitor/config/styles/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle header() => GoogleFonts.montserrat(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      );

  static TextStyle title() => GoogleFonts.montserrat(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      );

  static TextStyle regular() => GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      );

  static TextStyle description() => GoogleFonts.montserrat(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.gray,
      );    
}
