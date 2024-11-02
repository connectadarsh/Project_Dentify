import 'package:dentify/controller/signup_crud.dart';
import 'package:dentify/model/username_and_password_db/username_password.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/view/Login/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final SignupCrud _signupCrud = SignupCrud();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordConroller =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
      ),
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'SignUp',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CustomTextfield(
                      controller: _usernameController,

                      hintText: 'Enter your name',
                      preffixIcon: Icons.person),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    controller: _passwordController,

                    hintText: 'Password',
                    preffixIcon: Icons.lock,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextfield(
                    controller: _confirmpasswordConroller,

                    hintText: 'Confirm Password',
                    preffixIcon: Icons.lock,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  CoustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _signupCrud.addSignupData(UserpassDb(
                            username: _usernameController.text,
                            password: _passwordController.text));
                        const snackbar = SnackBar(
                          content: Text('Successfully Signed in'),
                          duration: Duration(seconds: 5),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ));
                      }
                    },
                    text: 'Signup',
                    width: 350,
                    height: 50,
                   )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
