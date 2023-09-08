import 'package:flutter/material.dart';
import 'package:hotel_clean/theme/colors.dart';

abstract class AppTextStyles {
  static TextStyle sfPro18w500 = const TextStyle(
    fontFamily: 'SF',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: Colors.black,
  );

  static TextStyle sfPro22w500 = const TextStyle(
    fontFamily: 'SF',
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: Colors.black,
  );

  static TextStyle sfPro14w500 = const TextStyle(
    fontFamily: 'SF',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.c0D72FF,
  );

  static TextStyle sfPro16w500 = const TextStyle(
    fontFamily: 'SF',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.2,
    color: AppColors.c828796,
  );
  static TextStyle sfPro17w400 = const TextStyle(
    fontFamily: 'SF',
    fontSize: 17,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.17,
    height: 1.2,
    color: AppColors.cA9ABB7,
  );
  static TextStyle sfPro16w500letter = const TextStyle(
    fontFamily: 'SF',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.1,
    letterSpacing: 0.1,
    color: Colors.white,
  );

  static TextStyle sfPro16w400 = const TextStyle(
    fontFamily: 'SF',
    fontSize: 16,
    height: 1.1,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.75,
    color: AppColors.c14142B,
  );
  static TextStyle sfPro12w400 = const TextStyle(
    fontFamily: 'SF',
    fontSize: 12,
    // height: 1.2,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.12,
    color: AppColors.cA9ABB7,
  );
  static TextStyle sfPro30w600 = const TextStyle(
    fontFamily: 'SF',
    fontSize: 30,
    fontWeight: FontWeight.w600,
    height: 1.2,
    color: Colors.black,
  );
}
