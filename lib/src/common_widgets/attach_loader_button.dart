import 'package:flutter/material.dart';
import 'package:zoho_gatherly/src/ui_utils/text_styles.dart';

class AttachingFileWidget extends StatelessWidget {
  const AttachingFileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child:  Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            height: 20,
            width: 20,
          ),
          const SizedBox(width: 16.0),
          Text(
            'Attaching file ...',
            style: TextStyles.textColor.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}