import 'package:flutter/material.dart';
import 'package:zoho_gatherly/src/routing/route_constants.dart';
import 'package:zoho_gatherly/src/ui_utils/text_styles.dart';
import '../../utils/utils.dart';
import '../../constants/string_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
   _startTimer();
    super.initState();
  }

  Future<void> _startTimer()async{
    await Future.delayed(const Duration(seconds: 1), _moveToNextPage);
  }

  Future<void> _moveToNextPage()async {
    Future.delayed(const Duration(milliseconds: 1200)).then((_){
      Navigator.of(context).pushNamedAndRemoveUntil(
          RouteConstants.homeScreen, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -200,
            left: -110,
            child: Container(
              width: 500,
              height: 500,
              decoration: const BoxDecoration(
                color: AppColors.splashCurve,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(280)),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          Positioned(
            bottom: -200,
            right: -110,
            child: Container(
              width: 500,
              height: 500,
              decoration: const BoxDecoration(
                color: AppColors.splashCurve,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(280)),
                shape: BoxShape.rectangle,
              ),
            ),
          ),
          Center(
            child:Text(StringConstants.appName.tr(context),style: TextStyles.splashText,)
          ),
        ],
      ),
    );
  }
}