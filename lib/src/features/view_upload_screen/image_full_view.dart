import 'dart:io';

import 'package:flutter/material.dart';

class FullView extends StatelessWidget {
  const FullView({super.key, this.file, this.filePath, this.fit});
  final File? file;
  final String? filePath;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Image.file(
          file!,
          fit: BoxFit.fill,
        )
      ),
    );
  }
}
