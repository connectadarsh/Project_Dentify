import 'package:dentify/utilities/colors/colors.dart';
import 'package:dentify/utilities/custom_widgets/button.dart';
import 'package:dentify/view/Login/login.dart';
import 'package:dentify/view/Signup/Signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Selection extends StatelessWidget {
  const Selection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
              height: 120,
              child: Image.asset('asset/tooth1.png'),
            ),SizedBox(height: 35,),
              Text('Dentify',style: TextStyle(
                fontSize: 25,color: Color.fromARGB(255, 28, 151, 188),
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 20,),
              Text("Let's get started!",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),
              ),
              Text("Login to enjoy the features we've\n                     provided"),
              SizedBox(height: 40,),
              CoustomButton(onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Login(),)
                
                );
              }, 
              text: 'Login',
              width: 250,
              height: 50,
              ),
              SizedBox(height: 15,),
              CoustomButton(onTap: (){
                 Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Signup(),)
                
                );
              }, text: 'sign Up',
                width: 250,
              height: 50,
              color:AppColors.secondary ,
              textColor: AppColors.primary,
              )
              
          ],),
        ),
      ) ,
    );
  }
}