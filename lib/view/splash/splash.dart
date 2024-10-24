import 'package:dentify/view/Homepage/ControlBottom.dart';
import 'package:dentify/view/Homepage/main_home.dart';
import 'package:dentify/view/selection/selection.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>const Selection())
      );
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 120, 103),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 170,
                child: Image.asset('asset/tooth1.png'),
              ),
              SizedBox(height: 35,),
              Text('Dentify',style: TextStyle(
                fontSize: 45,color: Colors.white
              ),)
            ],
          ),
        ),
      ),
    );
  }
}