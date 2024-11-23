import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/edit_profile/edit_form.dart';
import 'package:dentify/view/edit_profile/edit_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final formKey = GlobalKey<FormState>();
  String? selectedImagePath;

  late ProfileDb profileData;
  @override
  void initState() {
    var boxDatas =
        Hive.box<ProfileDb>('profileBox').values.toList().cast<ProfileDb>();
    profileData = boxDatas.last;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                // Text(
                //   profileData.specialization.toString(),
                //   // 'Edit Your Profile',
                //   style: TextStyle(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 25,
                //       color: AppColors.titile),
                // ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Edit your details',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                const SizedBox(height: 40),
                EditProfileImage(
                  oldImage: profileData.image,
                  onImageSelected: (imagePath) {
                    setState(() {
                      selectedImagePath = imagePath;
                    });
                  },
                ),
                const SizedBox(height: 40),
                EditForm(
                  data: profileData,
                  selectedImage: selectedImagePath,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
