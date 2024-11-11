import 'package:dentify/controller/profile_fn.dart';
import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/view/Complete_profile/formComplete.dart';
import 'package:dentify/view/Complete_profile/profile_picker.dart';
import 'package:dentify/view/edit_profile/edit_form.dart';
import 'package:dentify/view/edit_profile/edit_image.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  
  final formKey=GlobalKey<FormState>();
 String?selectedImagePath;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.secondary,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              SizedBox(
                height: 40,
              ),
              Text('Complete Your Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: AppColors.titile
              ),
              ),
              SizedBox(height: 12,),
              Text('Add your details',
              style: TextStyle(fontWeight: FontWeight.w500,
              fontSize: 20
              ),
              ),
              SizedBox(height: 40),
             EditProfileImage(onImageSelected: (imagePath) {
              setState(() {
                selectedImagePath=imagePath;
              });
             },),
             SizedBox(height: 40),
             EditForm(selectedImage: selectedImagePath,),
             SizedBox(height: 20,),
            
            ],),
          
          ),
        ),
      ) ,
    );
  }
}