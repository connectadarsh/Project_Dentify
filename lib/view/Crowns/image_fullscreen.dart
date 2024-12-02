import 'dart:io';
import 'package:flutter/material.dart';

class ImageFullScreenPage extends StatelessWidget {
  final String imagePath;

  const ImageFullScreenPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background set to black for image contrast
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context); // Close the full-screen image when tapped
          },
          child: Image.file(
            File(imagePath),
            fit: BoxFit.contain, // Make sure the image fits completely
          ),
        ),
      ),
    );
  }
}
