
import 'package:flutter/material.dart';
import 'package:zoho_gatherly/src/ui_utils/fonts.dart';
import 'package:zoho_gatherly/src/utils/src/colors/app_colors.dart';

abstract class TextStyles {
  static const textColor = TextStyle(
    color: AppColors.textColor,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    fontFamily: Fonts.sfCompactDisplay,
  );
  static const mainHeader = TextStyle(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: 32,
    fontFamily: Fonts.sfCompactDisplay,
  );
  static const splashText = TextStyle(
    color: AppColors.splashText,
    fontWeight: FontWeight.w400,
    fontSize: 30,
    fontFamily: Fonts.seymourRegular,
  );
}