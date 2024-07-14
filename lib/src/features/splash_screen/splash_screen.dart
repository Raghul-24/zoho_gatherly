import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../constants/string_constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: AppColors.primaryColor,
          child: Center(child: Text(StringConstants.appName.tr(context)))),
    );
  }
}
