// import 'package:dentify/model/Braces_db/braces_db.dart';
// import 'package:dentify/model/username_and_password_db/username_password.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:image_picker/image_picker.dart';

// class CamButtonIcon extends StatefulWidget {
//   const CamButtonIcon({super.key});

//   @override
//   State<CamButtonIcon> createState() => _CamButtonIconState();
// }

// class _CamButtonIconState extends State<CamButtonIcon> {
//       // final bracesDetails=Hive.box<BracesDb>('BracesBox');
//   String? image;
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         icon: Icon(Icons.add_a_photo),
//         onPressed: () {
//           showModalBottomSheet(
//               context: context,
//               builder: (context) {
//                 return SizedBox(
//                   width: double.infinity,
//                   height: 150,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       Column(
//                         children: [
//                           IconButton(
//                               onPressed: () {
                               
                              
//                               },
//                               icon: const Icon(
//                                 Icons.camera,
//                                 size: 70,
//                               )),
//                           const Text('camera'),
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           IconButton(
//                               onPressed: () {
                                
//                               },
//                               icon: const Icon(
//                                 Icons.image,
//                                 size: 70,
//                               )),
//                           const Text('Gallery')
//                         ],
//                       )
//                     ],
//                   ),
//                 );
//               });
//         });
//   }

//   //  pick image From gallery
//   Future _imageFromGal() async {
//     final fetchedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (fetchedImage == null) return;
//     setState(() {
//       image = fetchedImage.path;
// // bracesDetails.add(BracesDb(image: image!));
//     });
//   }

// // pick image From camera
//   Future _imageFromCam() async {
//     final fetchedImage =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     if (fetchedImage == null) return;
//     setState(() {
//       image = fetchedImage.path;
//       // bracesDetails.add(BracesDb(image: image!));
//     });
//   }
// }
