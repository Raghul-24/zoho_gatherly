import 'package:flutter/material.dart';
import 'package:size_setter/size_setter.dart';

class AppSnackBar {
  final String? message;
  final String? actionText;
  final VoidCallback? onPressed;
  final bool isPositive;
  final bool bottom;

  const AppSnackBar(
      {required this.message,
        this.actionText,
        this.onPressed,
        this.bottom = true,
        this.isPositive = false});

  void showAppSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isPositive ? Colors.green[400] : Colors.red,
        margin: bottom
            ? EdgeInsets.symmetric(
            horizontal: Utils.getScreenWidth(context, 23),
            vertical: Utils.getScreenHeight(context, 35))
            : EdgeInsets.only(
            bottom: context.screenWidth * 0.9,
            left: Utils.getScreenWidth(context, 23),
            right: Utils.getScreenWidth(context, 23)),
        content: Text(
          message != null
              ? message!.length < 200
              ? message.toString()
              : message.toString().substring(0, 200)
              : "",
          textAlign: TextAlign.left,
          softWrap: true,
          style: const TextStyle(color: Colors.white),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}