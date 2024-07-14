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
      body: Container(
          color: AppColors.whiteColor,
          child: Center(child: Text(StringConstants.appName.tr(context),style: TextStyles.splashText,))),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800]!;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.90);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.623,
        size.width * 1, size.height * 0.60);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// class UpsideDownClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.lineTo(0, 0);
//     path.lineTo(0, size.height - 50);
//
//     // Create a curve
//     path.quadraticBezierTo(
//         size.width / 2,
//         size.height + 50,
//         size.width,
//         size.height - 50
//     );
//
//     path.lineTo(size.width, size.height - 50);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
