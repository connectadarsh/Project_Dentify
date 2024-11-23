import 'dart:io';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileImage extends StatefulWidget {
  final String? oldImage;
  final Function(String?)? onImageSelected;
  const EditProfileImage(
      {super.key, required this.onImageSelected, required this.oldImage});
  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  String? image;

  
  @override
  Widget build(context) {
    return Stack(
      children: [
        (image == null)
            ?  CircleAvatar(
                radius: 55,
                backgroundImage: FileImage(File(widget.oldImage!)),
              )
            : CircleAvatar(
                radius: 55,
                backgroundImage: FileImage(File(image!)),
              ),
        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                  onPressed: () {
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
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.secondary,
                  ))),
        )
      ],
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
