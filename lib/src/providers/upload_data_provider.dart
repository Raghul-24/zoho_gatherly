import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zoho_gatherly/src/ui_utils/app_snack_bar.dart';

class UploadDataProvider extends ChangeNotifier{
  List<File?>? fileList = [];
  void addImage(XFile? xfile, BuildContext context) {
    final file = File(xfile!.path);
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    print(sizeInMb);
    if (sizeInMb < 5) {
      fileList?.add(File(xfile.path));
    } else {
      AppSnackBar(
          message: "File size exceeds 5MB limit. Please choose a smaller file and try again",
          actionText: 'Ok',
          isPositive: false,
          onPressed: () => {}).showAppSnackBar(context);
    }
    notifyListeners();
  }
}