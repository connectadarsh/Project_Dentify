import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/view/edit_profile/edit_form.dart';
import 'package:dentify/view/edit_profile/edit_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Edit your profile',
                      style: GoogleFonts.alef(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
