import 'package:flutter/material.dart';

part 'dark_theme.dart';
part 'light_theme.dart';

enum ThemeType { light, dark }

class AppTheme {
  const AppTheme._(this.type);

  factory AppTheme.fromType(ThemeType type) => AppTheme._(type);

  final ThemeType type;

  ThemeData get themeData {
    switch (type) {
      case ThemeType.dark:
        return darkTheme;
      case ThemeType.light:
      default:
        return lightTheme;
    }
  }
}
