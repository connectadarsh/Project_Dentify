import 'package:dentify/controller/login_fn.dart';
import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/Text_field.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/view/Complete_profile/main_complete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
     LoginFn loginFn=LoginFn();
    TextEditingController usernameController= TextEditingController();
    TextEditingController passwordController= TextEditingController();
    final formkeyLogin=GlobalKey<FormState>();
    return  Scaffold(
      appBar: AppBar(backgroundColor: AppColors.secondary,
    
      ),

      backgroundColor: AppColors.secondary,
      body:SafeArea(
        child:  Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkeyLogin,
              child: Column(
               
                      
                children: [
         Text('Login',
              
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
                ),
                SizedBox(height: 30,),
                CustomTextfield(
                  controller: usernameController,

                hintText: 'Username',
                preffixIcon: Icons.mail),    
                SizedBox(height:20 ,),
                CustomTextfield(
                  controller: passwordController,

                  hintText: 'Password',
                preffixIcon: Icons.lock,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                SizedBox(height: 80,),
                CoustomButton(onTap: ()async{
                    if(formkeyLogin.currentState!.validate()){
                      final bool login=await loginFn.isLogin(userName: usernameController.text, passWord: passwordController.text);
                      if(login){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CompleteProfile(),));
                      }
                      else{
                          const snackbar=SnackBar(content: Text('Incorrect credentials'),
                    duration: Duration(seconds: 5),
                    backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    }
                }, text: 'Login',
                width: 350,
                height: 50,)
                
                
               
              ],),
            ),
          ),
        ),
      ) ,
    );
  }
}