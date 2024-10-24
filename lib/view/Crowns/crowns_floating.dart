import 'package:dentify/controller/crowns_fn.dart';
import 'package:dentify/model/Braces_db/braces_db.dart';
import 'package:dentify/model/crowns_db/crowns_db.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class CrownsFloating extends StatefulWidget {
  const CrownsFloating({super.key});

  @override
  State<CrownsFloating> createState() => _CrownsFloatingState();
}

class _CrownsFloatingState extends State<CrownsFloating> {
 final CrownsDetails=Hive.box<CrownsDb>('CrownsBox');
  String? image;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add_a_photo),
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
              });
        });
  }

  //  pick image From gallery
  Future _imageFromGal() async {
    final fetchedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (fetchedImage == null) return;
    setState(() {
      image = fetchedImage.path;
      CrownsDetails.add(CrownsDb(image: image!));
    });
  }

// pick image From camera
  Future _imageFromCam() async {
    final fetchedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (fetchedImage == null) return;
    setState(() {
      image = fetchedImage.path;
       CrownsDetails.add(CrownsDb(image: image!));
    });
  }
}
