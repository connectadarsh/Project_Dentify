import 'package:dentify/controller/profile_fn.dart';
import 'package:dentify/model/add_account_db/add_account_db.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/view/Homepage/ControlBottom.dart';
import 'package:flutter/material.dart';

class Completeform extends StatefulWidget {
  const Completeform({super.key});

  @override
  State<Completeform> createState() => _CompleteformState();
}

class _CompleteformState extends State<Completeform> {
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
          SizedBox(height: 25),
          CustomTextfield(
              controller: _qualificationController,

              labelText: 'Qualification',
              borderRadius: 10,
              hintText: 'Enter your qualification'),
          SizedBox(height: 25),
          CustomTextfield(
              labelText: 'Specialization',
              borderRadius: 10,
              hintText: 'Enter your stream'),
          SizedBox(height: 15),
          CustomTextfield(
              controller: _regestrationController,

              labelText: 'Registration',
              borderRadius: 10,
              hintText: 'Enter your registeration number'),
          SizedBox(height: 15),
          CustomTextfield(
              labelText: 'Mobile number',
              borderRadius: 10,
              hintText: 'Enter your mobile number',
              controller: _mobilenumberController,
              ),
          SizedBox(height: 15),
          CustomTextfield(
              labelText: 'Clinic name',
              borderRadius: 10,
              hintText: 'Enter your clinic name',
              controller: _clinicnameController,
              ),
          SizedBox(
            height: 20,
          ),
          CoustomButton(
            onTap: () async {
              if (formKey.currentState!.validate()) {
                _profileDetails.addProfileDetails(ProfileDb(
                    username: _yournameController.text,
                    qualification: _qualificationController.text,
                    regestration: _regestrationController.text,
                    mobilenumber: _mobilenumberController.text,
                    clinicname: _clinicnameController.text
                    ));

                          const snackbar=SnackBar(content: Text('Successfully Signed in'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const ControlBottom(),)
                
                );
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
