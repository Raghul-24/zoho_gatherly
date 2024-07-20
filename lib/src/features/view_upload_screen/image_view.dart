import 'dart:io';
import 'package:flutter/material.dart';
import 'package:size_setter/size_setter.dart';
import 'package:zoho_gatherly/src/features/view_upload_screen/image_full_view.dart';
import 'package:zoho_gatherly/src/utils/src/colors/app_colors.dart';

class ImageView extends StatelessWidget {
  const ImageView(
      {super.key,
        this.file,
        this.onTap,
        this.isRemove = false,
        this.height,
        this.width,
        this.borderRadius,
        this.filePath,
        this.fit});

  final File? file;
  final VoidCallback? onTap;
  final bool isRemove;
  final double? height;
  final double? width;
  final String? filePath;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 120.h,
      width: width ?? 120.w,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.passthrough,
        children: [
          if (file != null || filePath != null)
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullView(
                          fit: fit,
                          file: file,
                          filePath: filePath,
                        )));
              },
              child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: borderRadius ??
                          const BorderRadius.all(Radius.circular(20))),
                  width: double.infinity,
                  child: Image.file(
                    file!,
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  )),
            ),
          // if ((file != null || filePath != null) && isRemove)
          //   Positioned(
          //     top: -8,
          //     right: -2,
          //     child: GestureDetector(
          //       onTap: onTap,
          //       child: Container(
          //         height: 20,
          //         width: 20,
          //         decoration: BoxDecoration(
          //             color: AppColors.redColor,
          //             borderRadius: BorderRadius.circular(20)),
          //         child: const FittedBox(
          //             child: Icon(Icons.close, color: Colors.white)),
          //       ),
          //     ),
          //   )
        ],
      ),
    );
  }
}
