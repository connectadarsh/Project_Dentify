import 'package:dentify/controller/profile_fn.dart';
import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/view/Homepage/ControlBottom.dart';
import 'package:flutter/material.dart';

class EditForm extends StatefulWidget {
  final String? selectedImage;
  final ProfileDb data;
  const EditForm({super.key, required this.selectedImage, required this.data});

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final ProfileDetails _profileDetails = ProfileDetails();
  final TextEditingController _yournameController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _specializationController =
      TextEditingController();
  final TextEditingController _regestrationController = TextEditingController();
  final TextEditingController _mobilenumberController = TextEditingController();
  final TextEditingController _clinicnameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
@override
  void initState() {
    _yournameController.text=widget.data.username!;
    _qualificationController.text=widget.data.qualification!;
    _specializationController.text=widget.data.specialization!;
    _regestrationController.text=widget.data.regestration!;
    _mobilenumberController.text=widget.data.mobilenumber!;
    _clinicnameController.text=widget.data.clinicname!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextfield(
              controller: _yournameController,
              labelText: 'Your name',
              borderRadius: 10,
              hintText: 'Enter your name'),
          const SizedBox(height: 25),
          CustomTextfield(
              controller: _qualificationController,
              labelText: 'Qualification',
              borderRadius: 10,
              hintText: 'Enter your qualification'),
          const SizedBox(height: 25),
          CustomTextfield(
              labelText: 'Specialization',
              controller: _specializationController,
              borderRadius: 10,
              hintText: 'Enter your stream'),
          const SizedBox(height: 15),
          CustomTextfield(
            controller: _regestrationController,
            labelText: 'Registration',
            borderRadius: 10,
            hintText: 'Enter your registeration number',
            keyboardtype: TextInputType.numberWithOptions(),
          ),
          const SizedBox(height: 15),
          CustomTextfield(
            labelText: 'Mobile number',
            borderRadius: 10,
            hintText: 'Enter your mobile number',
            controller: _mobilenumberController,
            keyboardtype: TextInputType.numberWithOptions(),
            maxlength: 10,
          ),
          const SizedBox(height: 15),
          CustomTextfield(
            labelText: 'Clinic name',
            borderRadius: 10,
            hintText: 'Enter your clinic name',
            controller: _clinicnameController,
          ),
          const SizedBox(
            height: 20,
          ),
          CoustomButton(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                _profileDetails.UpdateProfileDetails(ProfileDb(
                    username: _yournameController.text,
                    qualification: _qualificationController.text,
                    regestration: _regestrationController.text,
                    mobilenumber: _mobilenumberController.text,
                    specialization: _specializationController.text,
                    clinicname: _clinicnameController.text,
                    image: widget.selectedImage??widget.data.image,
                    id: widget.data.id
                    ));

                const snackbar = SnackBar(
                  content: Text('Successfully Signed in'),
                  duration: Duration(seconds: 2),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                Navigator.pop(context);
              }
            },
            text: 'Submit',
            borderRadius: 10,
            height: 50,
            width: 350,
          )
        ],
      ),
    );
  }
}
