import 'package:dentify/view/Homepage/ControlBottom.dart';
import 'package:dentify/view/Login/login.dart';
import 'package:dentify/view/selection/selection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}


class _SplashState extends State<Splash> {
@override
  void initState() {
   checkUserLoggedIn();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 120, 103),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 170,
                child: Image.asset('asset/appicon1.png'),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                'Dentify',
                style: TextStyle(fontSize: 45, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
// ----------------shared preference---------------
 Future<void>gotoLogin()async{
   await Future.delayed(const Duration(seconds: 3));
   // ignore: use_build_context_synchronously
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Selection()),);
  }

  Future<void>checkUserLoggedIn()async{
    final sharedPrefs=await SharedPreferences.getInstance(); 
     final userLoggedIn=sharedPrefs.getBool(saveKeyLogIn);
     if(userLoggedIn==null|| userLoggedIn==false){
    gotoLogin();
     }
    else{
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ControlBottom(),));
    }
  }
}
