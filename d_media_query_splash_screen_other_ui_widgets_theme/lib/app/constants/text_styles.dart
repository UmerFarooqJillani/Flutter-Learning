import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const headline = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const body = TextStyle(
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const hint = TextStyle(
    fontSize: 14,
    color: AppColors.textSecondary,
  );
}
