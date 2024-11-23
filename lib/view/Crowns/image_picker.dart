import 'dart:io';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CrownImagePicker extends StatefulWidget {
  final Function(String?)? onImageSelected;
  const CrownImagePicker({super.key, required this.onImageSelected});
  @override
  State<CrownImagePicker> createState() => _CrownImagePickerState();
}

class _CrownImagePickerState extends State<CrownImagePicker> {
  String? image;
  @override
  Widget build(context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return SizedBox(
              width: double.infinity,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            _imageFromCam();
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.camera,
                            size: 70,
                          )),
                      const Text('camera'),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            _imageFromGal();
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.image,
                            size: 70,
                          )),
                      const Text('Gallery')
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
      child: (image == null)
          ? Center(
              child: DottedBorder(
                dashPattern: const [6, 6],
                child: Container(
                  height: 250,
                  width: 300,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 194, 234, 230),
                  ),
                  child: Icon(Icons.camera_alt_outlined),
                ),
              ),
            )
          : Center(
              child: DottedBorder(
                dashPattern: const [6, 6],
                child: Container(
                  height: 250,
                  width: 300,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 194, 234, 230),
                  ),
                  child: Image.file(
                    File(image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
    );
  }

  //  pick image From gallery
  Future _imageFromGal() async {
    final fetchedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (fetchedImage == null) return;
    setState(() {
      image = fetchedImage.path;
    });
    widget.onImageSelected?.call(image);
  }

// pick image From camera
  Future _imageFromCam() async {
    final fetchedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (fetchedImage == null) return;
    setState(() {
      image = fetchedImage.path;
    });
    widget.onImageSelected?.call(image);
  }
}
