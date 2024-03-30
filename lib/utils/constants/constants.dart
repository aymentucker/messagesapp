import 'package:flutter/material.dart';

/// A utility class for managing sizes used throughout the app across different devices.
class AppSizes {
  // Padding and margins
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  // Font sizes
  static const double textSmall = 12.0;
  static const double textMedium = 16.0;
  static const double textLarge = 20.0;
  static const double textExtraLarge = 24.0; // Example of adding new size

  // Icon sizes
  static const double iconSmall = 20.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 30.0;

  /// Calculates dynamic width based on the percentage of the screen's width.
  static double dynamicWidth(double percentage, BuildContext context) =>
      MediaQuery.of(context).size.width * percentage;

  /// Calculates dynamic height based on the percentage of the screen's height.
  static double dynamicHeight(double percentage, BuildContext context) =>
      MediaQuery.of(context).size.height * percentage;

  // Specific widget sizes that could be reused
  static const double buttonHeight = 48.0;
  static const double iconSizeSmall = 24.0;
  static const double iconSizeLarge = 48.0;

  /// Returns an adaptive text size based on the device's screen size.
  /// It increases the size for larger screens such as tablets.
  static double adaptiveTextSize(double size, BuildContext context) =>
      MediaQuery.of(context).size.shortestSide > 600 ? size * 1.5 : size;

  /// Ensures text size is accessible, respecting user's system settings.
  static double accessibleTextSize(double size, BuildContext context) =>
      size * MediaQuery.textScaleFactorOf(context);
}

class Spacing {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;
  // Add more spacing units
}

class AppDimensions {
  static const double cardCornerRadius = 8.0;
  static const double elevation = 2.0;
  static const double borderWidth = 1.0;
  // Define other UI dimensions as needed
}

class AppMargins {
  static const double screenPadding = 16.0;
  static const EdgeInsets dialogPadding = EdgeInsets.all(20.0);
  // Add more specific paddings and margins
}

class Animations {
  static const durationFast = Duration(milliseconds: 200);
  static const durationMedium = Duration(milliseconds: 500);
  static const curveDefault = Curves.easeInOut;
}
