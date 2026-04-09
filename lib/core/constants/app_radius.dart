import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/app_sizes.dart';

class AppRadius {
  // Returns the double value
  static double get sm => AppSize.s8.value;
  static double get md => AppSize.s16.value;
  static double get lg => AppSize.s24.value;

  // Helper for actual BorderRadius objects
  static BorderRadius get circularMd =>
      BorderRadius.circular(AppSize.s16.value);
}
